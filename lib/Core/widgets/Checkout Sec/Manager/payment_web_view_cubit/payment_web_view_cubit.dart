import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'payment_web_view_state.dart';

class PaymentWebViewCubit extends Cubit<PaymentWebViewState> {
  PaymentWebViewCubit(this.paymentKey) : super(PaymentWebViewInitial());
  final String paymentKey;

  late WebViewController webViewController;

  void setController() {
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

            // Check if the URL is the bank's URL

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://accept.paymob.com/api/acceptance/iframes/824160?payment_token=$paymentKey'));
  }
}
