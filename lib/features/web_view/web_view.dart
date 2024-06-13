import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  MyWebView({super.key, required this.pageTittle});
  static const routeName = 'webView';
  static const route = '/webView';
  String? pageTittle, webURL;

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            isLoading = false;
            setState(() {});
          },
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  WebViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          // ignore: prefer_const_constructors
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primaryColor,
          ),
        ),
        title: Text(
          widget.pageTittle!,
          style:
              AppTextStyle.bold18.copyWith(color: AppColors.appHeaderColorNew),
        ),
      ),
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
                color: AppColors.primaryColor,
              ),
            )
          : WebViewWidget(
              controller: controller!,
            ),
    );
  }
}
