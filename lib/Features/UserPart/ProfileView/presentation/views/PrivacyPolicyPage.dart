import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/generated/l10n.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar(context, title: S.of(context).PrivacyPolicy),
      body: const PrivacyPlociyWebView(),
    );
  }
}

class PrivacyPlociyWebView extends StatefulWidget {
  const PrivacyPlociyWebView({super.key});

  @override
  State<PrivacyPlociyWebView> createState() => _PrivacyPlociyWebViewState();
}

class _PrivacyPlociyWebViewState extends State<PrivacyPlociyWebView> {
  late WebViewController webViewController;
  bool isLoaded = false;
  @override
  void initState() {
    webViewController = WebViewController();
    setcontroller();
    super.initState();
  }

  setcontroller() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            setState(() {
              isLoaded = true;
            });
          },
          onNavigationRequest: (NavigationRequest request) {
            log(request.url);
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://www.termsfeed.com/live/bf4c71c8-c54a-4232-98fe-974042fd3a65'));
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? WebViewWidget(
            controller: webViewController,
          )
        : const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(child: CircularProgressIndicator(color: pKcolor)),
          );
  }
}
