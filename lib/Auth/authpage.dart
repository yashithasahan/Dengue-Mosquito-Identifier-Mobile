import 'package:flutter/material.dart';
import 'package:mosquito_idnetifer/Screens/Signup_screen/components/signup_body.dart';
import 'package:mosquito_idnetifer/Screens/Signup_screen/signupscreen.dart';
import '../Screens/Login/login_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showloginscreen = true;

  void toggleScreens() {
    setState(() {
      showloginscreen = !showloginscreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginscreen) {
      return const LoginScreen();
    } else {
      return signupscreen();
    }
  }
}
