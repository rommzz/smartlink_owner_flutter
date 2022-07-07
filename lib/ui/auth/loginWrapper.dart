import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smartlink_owner_flutter/ui/auth/login.dart';
import 'package:smartlink_owner_flutter/ui/auth/loginWa.dart';

class LoginWrapper extends StatefulWidget {
  const LoginWrapper({Key? key}) : super(key: key);

  @override
  State<LoginWrapper> createState() => _LoginWrapperState();
}

class _LoginWrapperState extends State<LoginWrapper> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ), 
              backgroundColor: Colors.white,
              title: const  Center(
                child: Text('Login', style: TextStyle(color: Colors.black)),
              ),
              bottom: const TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(text: 'Nomor Wa'),
                  Tab(text: 'Email')
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: const LoginWaScreen()),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: const LoginScreen())
              ]
            ),
          )
        ),
      );
  }
}