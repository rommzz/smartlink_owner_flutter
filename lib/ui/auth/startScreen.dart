
import 'package:flutter/material.dart';
import 'package:smartlink_owner_flutter/ui/auth/login.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
      Scaffold(
        body:
        Container(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Selamat datang di SmartOwner.'),
                    ),
                    Center(
                      child: Text('Atur, kelola & pantau usaha laundry Anda kapanpun dan dimanapun dengan mudah.'),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Daftar'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: const EdgeInsets.all(22),
                            minimumSize: const Size.fromHeight(50)
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()));
                        },
                        child: Text('Login'),
                        style: OutlinedButton.styleFrom(
                            primary: Colors.blue,
                            padding: const EdgeInsets.all(22),
                            side: BorderSide(color: Colors.blue),
                            minimumSize: const Size.fromHeight(50)
                        ),
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
        
        persistentFooterButtons: [
          Container(
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: Column(
                  children: [
                    Center(
                      child: const Text('SmartOwner hadir dalam versi aplikasi untuk pengalaman yang lebih baik. Install sekarang!'),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {  },
                        child: Text('Download di Play Store'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          padding: const EdgeInsets.all(22),
                          minimumSize: const Size.fromHeight(50)
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          
        ]
      )
    );
  }
}