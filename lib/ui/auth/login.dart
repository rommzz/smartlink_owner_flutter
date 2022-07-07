import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartlink_owner_flutter/components/SButton.dart';
import 'package:smartlink_owner_flutter/ui/webview/webview.dart';
import 'package:smartlink_owner_flutter/utilities/theme_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  var loginIntro = RichText(
    text: TextSpan(
      style: new TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      children: const <TextSpan>[
        TextSpan(text: 'Silahkan masukkan '),
        TextSpan(text: 'Email ', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: 'dan '),
        TextSpan(text: 'kata sandi ', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: 'Anda untuk login.'),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(children: [
              Flexible(flex: 6, child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: loginIntro),
                  Center(
                    child: Column(children: [
                      const SizedBox(height: 10),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text('Email'),
                            ),
                            TextField(
                              onChanged: ((String value) {
                                email = value;
                              }),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ThemeColors.primary, width: 1.0),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                hintText: 'email@email.com',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text('Password'),
                              ),
                              TextField(
                                onChanged: (String value) {
                                  password = value;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: ThemeColors.primary, width: 1.0),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                  hintText: 'Kata Sandi',
                                ),
                              ),
                            ],
                          )
                      ),
                      const SizedBox(height: 10),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Lupa Kata Sandi?',
                            style: TextStyle(
                              color: ThemeColors.primary,
                            ),
                          )
                      ),
                    ]),
                  ),
                ],
              )),
              Flexible(child: Column(
                children: [
                  const Text('Belum punya akun? Datar Smartlink'),
                  const SizedBox(height: 10),
                  SButton(text: 'Login')
                ],
              ),),
            ],
            ),
          ),
        ),
      );
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
  _saveToken(Map data) async {
    final prefs = await SharedPreferences.getInstance();
    String token = data['token'];
    String idowner = data['idowner'];
    var rawUrl =
        'http://192.168.0.161:8080?token=$token&email=$email&idowner=$idowner';
    String url = rawUrl.toString();
    await prefs.setString('token', token);
    await prefs.setString('email', email);
    await prefs.setString('idowner', idowner);
    await prefs.setString('url', url);
    await prefs.setString('baseUrl', 'http://192.168.0.161:8080');
  }
}