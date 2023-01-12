import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mosquito_idnetifer/Screens/Home/home_screen.dart';
import 'package:mosquito_idnetifer/Screens/Signup_screen/signupscreen.dart';
import 'package:mosquito_idnetifer/Widgets/custom_textfield.dart';
import '../../forgot_pw_screen/forgot_pw_screen.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      // Navigate to the homepage
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Successfully signed in'),
            actions: <Widget>[
              OutlinedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
      // Handle any errors that may have occurred during sign-in
    }
  }

  final _loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              child: Image.asset(
                "assets/images/login_combine.png",
                width: size.width * 1,
              )),
          // Positioned(
          //     bottom: 0,
          //     right: 0,
          //     child: Image.asset(
          //       "assets/images/login_bottom.png",
          //       width: size.width * 0.7,
          //     )),
          const Positioned(
              top: 65,
              left: 15,
              child: Text(
                "Hello!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                userIcon: const Icon(Icons.account_circle_rounded),
                myController: _emailController,
                userHintText: "User Name",
                isPassword: false,
                errorTextEmpty: "Please Enter an Username",
              ),
              CustomTextField(
                userIcon: const Icon(Icons.lock),
                myController: _passwordController,
                userHintText: "Password",
                isPassword: true,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()));
                      },
                      child: const Text("Forgot Password?",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 20, right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40)),
                    Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color: const Color(0xFF0E86D4)),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward_ios,
                              color: Colors.white),
                          onPressed: signIn,
                        ))
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: prefer_const_constructors
                  Text("Don`t have an account ?  ",
                      style: const TextStyle(
                        color: Colors.black,
                      )),
                  GestureDetector(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signupscreen()));
                    }),
                    child: const Text("Register",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 28, 113, 182),
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
