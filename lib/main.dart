import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smartlink_owner_flutter/ui/auth/login.dart';
import 'package:smartlink_owner_flutter/ui/webview/webview.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  print(token);
  runApp(MaterialApp(home: token == null ? const LoginScreen() : const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Future <bool> _isAuthenticated() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString('token');
  //   bool isAuthenticated = token != null;
  //   print(isAuthenticated);
  //   return isAuthenticated;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
        ),
        body: const WebviewScreen()
      ),
    );
  }
}
