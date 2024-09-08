import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/showOrderPlaced.dart';

class PaymentWebView extends StatefulWidget {
  const PaymentWebView({Key? key, required this.paymentKey}) : super(key: key);
  final String paymentKey;

  @override
  _PaymentWebViewState createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController();
    setController();
  }

  setController() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (WebResourceError error) {
            log('Web resource error: ${error.description}');
            log('Error URL: ${error.url ?? ""}');
          },
          onNavigationRequest: (NavigationRequest request) {
            log('Navigating to: ${request.url}');
            webViewController.loadRequest(Uri.parse(request.url));

            if (request.url.contains(
                    'https://accept.paymobsolutions.com/api/acceptance/post_pay') &&
                request.url.contains('success=true')) {
              Navigator.pop(context);
              showOrderPlaced(context);
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://accept.paymob.com/api/acceptance/iframes/824160?payment_token=${widget.paymentKey}'));
  }

  // void _showBankNavigationDialog(String url) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Bank URL Detected'),
  //         content: Text('You are navigating to the bank URL: $url'),
  //         actions: [
  //           TextButton(
  //             child: Text('Continue'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
