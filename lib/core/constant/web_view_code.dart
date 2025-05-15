import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../feature/bottom_nav_bar/bottom_nav_bar.dart';
import '../func/show_toast.dart';
import 'constant.dart';

class OnlinePaymentScreen extends StatefulWidget {
  const OnlinePaymentScreen({super.key, required this.sessionId});
  final String sessionId;

  @override
  State<OnlinePaymentScreen> createState() => _OnlinePaymentScreenState();
}

class _OnlinePaymentScreenState extends State<OnlinePaymentScreen> {
  final _controller = Completer<WebViewController>();
  bool isLoading = false;
  late final Dio _client;

  Future<void> initSession() async {
    final id = widget.sessionId;
    final controller = await _controller.future;
    await controller.runJavaScript(
      'Checkout.configure({session: {id: "$id"}});',
    );
  }

  Future<void> checkout() async {
    final controller = await _controller.future;
    await controller
        .runJavaScript('Checkout.showPaymentPage();')
        .then((_) async {
          await controller.setOnConsoleMessage((consoleMessage) {
            log('MY URL::2 ${consoleMessage.message} setOnConsoleMessage');

            if (consoleMessage.message.contains(
              "Payment for this order has already been received",
            )) {
            } else if (consoleMessage.message.contains('"result":"ERROR"')) {
              log('## ${consoleMessage.message} ##');
            } else {}
          });
        })
        .catchError((error) {
          log('MY URL::2 with error:: $error setOnConsoleMessage');
        });
  }

  Future<void> buildWebView() async {
    setState(() {
      isLoading = true;
    });
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final controller =
        WebViewController.fromPlatformCreationParams(params)
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadFlutterAsset("assets/payment_test.html")
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageFinished: (value) async {
                setState(() {
                  isLoading = false;
                });
                log("MY URL:: onPageFinished:::: $value #");

                /// orderConfirmed log
                await initSession();
                await checkout();
              },
              onWebResourceError: (error) {
                log("onWebResourceError:::: $error #");
              },
              onUrlChange: (change) {
                log("onUrlChange:::: ${change.url} ####");
              },
              onNavigationRequest: (request) async {
                log("onNavigationRequest:::: ${request.isMainFrame}");
                log("onNavigationRequest:::: ${request.url} ##::::");

                final isOrderConfirmed = request.url.contains(
                  "payment-callback/",
                );
                const postPaymentEndpoint = "/api/payments/an/QnbPostPayment/";

                if (isOrderConfirmed) {
                  final qnbResponse = request.url.split("/");
                  final apiRequest =
                      postPaymentEndpoint + qnbResponse[qnbResponse.length - 1];

                  try {
                    final response = await _client.post(
                      apiRequest,
                      options: Options(
                        contentType: Headers.formUrlEncodedContentType,
                      ),
                    );

                    if (mounted) {
                      if (response.data == true) {
                        showToast(
                          message: "Payment Success",
                          backgroundColor: Colors.green,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavBarScreen(),
                          ),
                        );
                      } else {
                        showToast(
                          message: "Payment Failed",
                          backgroundColor: Colors.red,
                        );
                      }
                    }

                    log("apiRequest::: $apiRequest ###");
                  } on Exception catch (e) {
                    log(e.toString());
                    log("exception::: $e ###");
                  }
                }
                return NavigationDecision.navigate;
              },
            ),
          );

    _controller.complete(controller);
  }

  @override
  void initState() {
    super.initState();
    _client = Dio(BaseOptions(baseUrl: baseUrlTest));
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await buildWebView();
    });
  }

  @override
  void dispose() {
    _controller.future.then((controller) {
      controller.clearCache();
      controller.clearLocalStorage();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) return;
      },
      child: Scaffold(
        body:
            isLoading
                ? const _LoadingWidget()
                : FutureBuilder<WebViewController>(
                  future: _controller.future,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const _LoadingWidget();
                    }
                    return SafeArea(
                      child: WebViewWidget(
                        controller: snapshot.data!,
                      ).build(context),
                    );
                  },
                ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Text("Processing your payment...")),
          SizedBox(height: 30.0),
          Center(
            child: SizedBox(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
