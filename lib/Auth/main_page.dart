import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mosquito_idnetifer/Screens/Main_screen/main_screen.dart';
import '../Screens/Welcome/welcome_screen.dart';
import '../Screens/result/result_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MainScreen();
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
