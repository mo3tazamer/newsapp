import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViews extends StatelessWidget {
  var url;

  WebViews({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
