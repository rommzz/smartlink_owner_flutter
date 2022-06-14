// ignore_for_file: implementation_imports
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({Key? key}) : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  Size get screenSize => MediaQuery.of(context).size;
  late WebViewXController webviewController;

  @override
  Widget build(BuildContext context) {
    return WebViewX(
      height: screenSize.height / 2,
      width: min(screenSize.width * 0.8, 1024),
      initialSourceType: SourceType.urlBypass,
      // initialContent: '<h2> tes </h2>',
      initialContent: 'https://www.google.com/',
      onWebViewCreated: (controller) => webviewController = controller,
    );
  }
}
