// ignore_for_file: implementation_imports
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webviewx/webviewx.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({Key? key}) : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late WebViewXController webviewController;
  String token = '';
  String email = '';
  String idowner = '';
  String url = '';

  _setInitialUrl() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
    email = prefs.getString('email')!;
    idowner = prefs.getString('idowner')!;
    var rawUrl =
        'http://192.168.1.7:8080?token=$token&email=$email&idowner=$idowner';
    url = rawUrl.toString();
    print(url);
  }

  Size get screenSize => MediaQuery.of(context).size;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildWebViewX(),
      ),
    );
  }

  Widget _buildWebViewX() {
    return WebViewX(
      key: const ValueKey('webviewx'),
      initialContent:
          'http://192.168.1.7:8080?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFbWFpbCI6ImRldkBnbWFpbC5jb20iLCJFeHBpcnlUcmlhbERhdGUiOiIyMDIwLTAyLTI5VDA4OjI1OjA4KzA3OjAwIiwiSWRPd25lciI6IlRIRU9ORSIsIktvdGEiOiIzNTczIiwiTmFtYSI6IlNoaWRxb24gQWxrYWFmIERldiIsIlJlYWRvbmx5IjoiZmFsc2UiLCJUZWxwIjoiNjI4NTcwODc4MDc2NiIsIlRpbWVMb2dpbiI6IjIwMjItMDYtMTdUMDA6MDc6MTQrMDc6MDAiLCJVbml4SWQiOiI2ODM5NWQwOS1kZWJiLTRlNDgtOWRhMS1kNzQyMzZlNWI5MTIifQ.xAwVR1spVpUiSkMji_0T3k7UGRGjdJm5l23VNH_aIeE&email=dev@gmail.com&idowner=THEONE',
      initialSourceType: SourceType.url,
      onWebViewCreated: (controller) => webviewController = controller,
      height: screenSize.height,
      width: screenSize.width,
      onPageFinished: (src) => {print('finis $src')},
    );
  }
}
