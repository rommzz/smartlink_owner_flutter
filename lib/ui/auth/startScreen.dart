
import 'package:flutter/material.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
      Scaffold(
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(
              child: Text('Selamat datang di SmartOwner.'),
            ),
            Center(
              child: Text('Atur, kelola & pantau usaha laundry Anda kapanpun dan dimanapun dengan mudah.'),
            )
          ],
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