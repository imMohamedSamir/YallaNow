import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final StreamController<RemoteMessage> _messageController =
      StreamController<RemoteMessage>.broadcast();
  Stream<RemoteMessage> get onMessage => _messageController.stream;
  bool _isDisconnected = true;

  Future<Either<String, void>> init() async {
    try {
      await _requestPermission();
      await setupMessageHandler();
      await _setupBackgroundMessageHandler();
      return right(null);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  Future<void> connect() async {
    _isDisconnected = false;
    getToken();
  }

  Future<void> _requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
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
      if (!_isDisconnected) {
        log('Got a message whilst in the foreground!');
        log('Message data: ${message.notification!.title}\n${message.notification!.body}');

        if (message.notification != null) {
          log('Message also contained a notification: ${message.notification}');
          _messageController.add(message);
        }
      }
    });
  }

  Future<void> _setupBackgroundMessageHandler() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<String> getToken() async {
    String? token = await _firebaseMessaging.getToken();
    // log("FCM Token: $token");
    return (token ?? "");
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

  Future<void> disconnect() async {
    _isDisconnected = true;
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    log('Handling a background message: ${message.messageId}');
    log('message: ${message.data.toString()}');
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: message.hashCode,
        channelKey: 'basic_channel',
        title: message.notification?.title,
        body: message.notification?.body,
        // payload: message.data,
      ),
    );
  }
}
