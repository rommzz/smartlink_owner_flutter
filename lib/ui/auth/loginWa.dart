import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartlink_owner_flutter/ui/webview/webview.dart';
import 'package:smartlink_owner_flutter/utilities/theme_colors.dart';

class LoginWaScreen extends StatefulWidget {
  const LoginWaScreen({Key? key}) : super(key: key);

  @override
  State<LoginWaScreen> createState() => _LoginWaScreenState();
}

class _LoginWaScreenState extends State<LoginWaScreen> {
  String email = '';

  var loginIntro = RichText(
    text: TextSpan(
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      children: const <TextSpan>[
        TextSpan(text: 'Silahkan masukkan '),
        TextSpan(text: 'nomor WhatsApp ', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: ' Anda, Kami akan mengirimkan kode OTP untuk '),
        TextSpan(text: 'verifikasi', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 560),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: <Widget> [
                Column(
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
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                    ),
                                    hintText: 'email@email.com',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox(height: 10,)),
                  Column(
                    children: [
                      const Text('Belum punya akun? Datar Smartlink'),
                      const SizedBox(height: 10),
                      const Text('Atau mengalami kesulitan ?'),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: (() => _submit()),
                        child: Text('Submit'),
                        style: ElevatedButton.styleFrom(
                            primary: ThemeColors.primary,
                            padding: const EdgeInsets.all(22),
                            minimumSize: const Size.fromHeight(50)
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ) 
      );
  }
  _submit() async {
    try {
      var dio = Dio();
      var data = FormData.fromMap({
        'email': email,
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