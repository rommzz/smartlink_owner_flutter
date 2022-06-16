import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smartlink_owner_flutter/ui/webview/webview.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MaterialApp(
      title: 'Smart Owner',
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String email = '';
  String password = '';

  _saveToken(Map data) async {
    final prefs = await SharedPreferences.getInstance();
    String token = data['token'];
    String idowner = data['idowner'];
    var rawUrl =
        'http://192.168.1.7:8080?token=$token&email=$email&idowner=$idowner';
    String url = rawUrl.toString();
    await prefs.setString('token', token);
    await prefs.setString('email', email);
    await prefs.setString('idowner', idowner);
    await prefs.setString('url', url);
  }

  _submit() async {
    try {
      var dio = Dio();
      var data = FormData.fromMap({
        'email': email,
        'password': password,
      });
      Response res = await dio.post(
          'https://smartlink-owner-0-gateway-fljnd6wana-de.a.run.app/auth/byemailsign',
          data: data);
      if (res.data['status'] == true) {
        _saveToken(res.data['data']);
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WebviewScreen()));
      } else {
        // ignore: avoid_print
        print(res.data['msg']);
      }
    } catch (e) {
      log(e as String);
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yuan dobol',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Yuan dodoli'),
        ),
        body: Column(
          children: [
            Center(
              child: Column(children: [
                Center(
                  child: TextField(
                    onChanged: ((String value) {
                      email = value;
                    }),
                    decoration: const InputDecoration(
                      label: Text('Email'),
                      hintText: 'email@email.com',
                    ),
                  ),
                ),
                Center(
                  child: TextField(
                    onChanged: (String value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Password'),
                      hintText: 'Kata Sandi',
                    ),
                  ),
                ),
              ]),
            ),
            Center(
                child: TextButton(
              onPressed: (() => _submit()),
              child: const Text('Submit'),
            ))
          ],
        ),
      ),
    );
  }
}
