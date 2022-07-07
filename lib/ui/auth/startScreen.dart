
import 'package:flutter/material.dart';
import 'package:smartlink_owner_flutter/ui/auth/loginWrapper.dart';
import 'package:smartlink_owner_flutter/utilities/theme_colors.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
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
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: ThemeColors.primary,
                            padding: const EdgeInsets.all(22),
                            minimumSize: const Size.fromHeight(50)
                        ),
                        child: const Text('Daftar'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const LoginWrapper()));
                        },
                        style: OutlinedButton.styleFrom(
                            primary: ThemeColors.primary,
                            padding: const EdgeInsets.all(22),
                            side: BorderSide(color: ThemeColors.primary),
                            minimumSize: const Size.fromHeight(50)
                        ),
                        child: const Text('Login'),
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
                    const Center(
                      child: Text('SmartOwner hadir dalam versi aplikasi untuk pengalaman yang lebih baik. Install sekarang!'),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {  },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          padding: const EdgeInsets.all(22),
                          minimumSize: const Size.fromHeight(50)
                        ),
                        child: const Text('Download di Play Store'),
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