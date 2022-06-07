import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
submit(){

}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yuan dodol',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Yuan dodol'),
        ),
        body: Column(
          children:  [
            const Center(
              child: TextField(
                decoration: InputDecoration(
                  label: Text('Email'),
                  hintText: 'email@email.com',
                ),
                onChanged: ,
              ),
            ),
            const Center(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  label: Text('Password'),
                  hintText: 'Kata Sandi',
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: submit(),
                child: const Text('sUbmit')
                )
            )
          ],
        ),
      ),
    );
  }
}