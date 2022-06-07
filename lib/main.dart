import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String email = '';
  String password = '';

  _submit() async {
    try {
      Response res;
      var dio = Dio();
      var data = {
        'email': email,
        'password': password,
      };
      res = await dio.post(
          'https://smartlink-owner-0-gateway-fljnd6wana-de.a.run.app//auth/byemailsign',
          data: data);
      // ignore: avoid_print
      print(data);
    } catch (e) {
      log('message');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yuan dobol',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Yuan dodol'),
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
