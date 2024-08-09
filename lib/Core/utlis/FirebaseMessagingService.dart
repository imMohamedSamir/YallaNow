import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/generated/l10n.dart';
import 'package:yallanow/main.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final StreamController<RemoteMessage> _messageController =
      StreamController<RemoteMessage>.broadcast();
  final StreamController<RemoteMessage> _bgmessageController =
      StreamController<RemoteMessage>.broadcast();
  Stream<RemoteMessage> get onMessage => _messageController.stream;
  Stream<RemoteMessage> get onBgMessage => _bgmessageController.stream;
  bool _isDisconnected = true;

  Future<Either<String, void>> init() async {
    try {
      await _requestPermission();
      await setupMessageHandler();
      await _setupBackgroundMessageHandler();
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<void> connect() async {
    _isDisconnected = false;
  }

  Future<String> getToken() async {
    String? token = await _firebaseMessaging.getToken();
    // log("FCM Token: $token");
    return (token ?? "");
  }

  Future<void> disconnect() async {
    _isDisconnected = true;
  }

  Future<void> _requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      criticalAlert: true,
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else {
      log('User declined or has not accepted permission');
      throw Exception("User declined or has not accepted permission");
    }
  }

  Future<void> setupMessageHandler() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log(message.notification!.body!);
      if (!_isDisconnected) {
        if (message.notification != null) {
          // log('Message also contained a notification: ${message.notification}');
          _messageController.add(message);
        }
      }
    });
  }

  Future<void> _setupBackgroundMessageHandler() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageOpenedApp(initialMessage);
    }
  }

  void _handleMessageOpenedApp(RemoteMessage message) {
    _bgmessageController.add(message);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // await Firebase.initializeApp();
    log('Handling a background message: ${message.messageId}');
    log('message: ${message.data.toString()}');
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: message.hashCode,
        channelKey: notifChannelKey,
        actionType: ActionType.Default,
        // payload: convertMapToString(originalMap: message.data),
        title: S.of(navigatorKey.currentContext!).NewRequest,
        body: S.of(navigatorKey.currentContext!).NewRequestBody,
        notificationLayout: NotificationLayout.Default,
        backgroundColor: pKcolor,
        wakeUpScreen: true,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'ACCEPT',
          label: "قبول",
          actionType: ActionType.Default,
        ),
        NotificationActionButton(
          key: 'REJECT',
          label: 'رفض',
          actionType: ActionType.Default,
        ),
      ],
    );
  }

  // Future<Either<String, void>> subscribeToTopic(String topicName) async {
  //   try {
  //     await _firebaseMessaging.subscribeToTopic(topicName);
  //     log('Subscribed to topic: $topicName');
  //     return right(null);
  //   } on Exception catch (e) {
  //     return left(e.toString());
  //   }
  // }

  // Future<Either<String, void>> unSubscribeToTopic(String topicName) async {
  //   try {
  //     await _firebaseMessaging.unsubscribeFromTopic(topicName);
  //     log('UnSubscribed to topic: $topicName');
  //     return right(null);
  //   } on Exception catch (e) {
  //     return left(e.toString());
  //   }
  // }
}
