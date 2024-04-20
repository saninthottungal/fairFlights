import 'package:flight_booking/Screens/ScreenWebView/Widgets/LoadingWidget.dart';
import 'package:flight_booking/Screens/ScreenWebView/Widgets/WebViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScreenWebView extends StatefulWidget {
  const ScreenWebView({super.key, required this.agencyLink});

  final String agencyLink;

  @override
  State<ScreenWebView> createState() => _ScreenWebViewState();
}

class _ScreenWebViewState extends State<ScreenWebView> {
  final WebViewController controller = WebViewController();
  bool isLoaded = false;
  @override
  void initState() {
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse(widget.agencyLink));
    controller.setNavigationDelegate(NavigationDelegate(
      onPageFinished: (url) {
        setState(() {
          isLoaded = true;
        });
      },
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await controller.reload();
              },
              icon: const Icon(Icons.replay_outlined)),
          IconButton(
              onPressed: () async {
                if (await controller.canGoBack()) {
                  await controller.goBack();
                } else {
                  messenger.showSnackBar(
                      const SnackBar(content: Text("no previous pages found")));
                }
              },
              icon: const Icon(Icons.arrow_back_ios)),
          IconButton(
              onPressed: () async {
                if (await controller.canGoForward()) {
                  await controller.goForward();
                } else {
                  messenger.showSnackBar(
                      const SnackBar(content: Text("no forward pages found")));
                }
              },
              icon: const Icon(Icons.arrow_forward_ios)),
          const SizedBox(width: 10)
        ],
      ),
      body: isLoaded
          ? CustomWebViewWidget(controller: controller)
          : const LoadingWidget(),
    );
  }
}
