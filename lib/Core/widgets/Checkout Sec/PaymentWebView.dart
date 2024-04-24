import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains("success=true") ||
                request.url.contains("data.message=Approved")) {
              print("success=true");
              return NavigationDecision.navigate;
            } else {
              return NavigationDecision.prevent;
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://accept.paymob.com/api/acceptance/iframes/824160?payment_token=${widget.paymentKey}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}

// void gotopaymentpage({required BuildContext context}) {
//   PaymobManager().getPaymentKey().then((value) => Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => PaymentWebView(paymentKey: value),
//       )));
// }
