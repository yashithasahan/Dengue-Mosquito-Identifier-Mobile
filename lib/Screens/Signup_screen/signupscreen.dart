import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mosquito_idnetifer/Screens/Home/home_screen.dart';
import 'package:mosquito_idnetifer/Screens/Login/login_screen.dart';
import 'package:mosquito_idnetifer/Screens/Signup_screen/components/signup_body.dart';

import '../../Widgets/custom_textfield.dart';

class signupscreen extends StatefulWidget {
  signupscreen({super.key});

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  // final user = FirebaseAuth.instance.currentUser!;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  Future Signup() async {
    try {
      if (passwordConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            //name: _nameController.text.trim(),
            password: _passwordController.text.trim());
        // await user.updateDisplayName(_nameController.text);
        // await user.reload();

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

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
                myController: _nameController,
                userHintText: "Name",
                isPassword: false,
                errorTextEmpty: "Please Enter Your Name",
              ),
              CustomTextField(
                userIcon: const Icon(Icons.mail_outlined),
                myController: _emailController,
                userHintText: "Email",
                isPassword: false,
                errorTextEmpty: "Please Enter Your Email",
              ),
              CustomTextField(
                userIcon: const Icon(Icons.lock),
                myController: _passwordController,
                userHintText: "Password",
                isPassword: true,
              ),
              CustomTextField(
                userIcon: const Icon(Icons.lock),
                myController: _confirmpasswordController,
                userHintText: "Confirm Password",
                isPassword: true,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 20, right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40)),
                    GestureDetector(
                      onTap: Signup,
                      child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: const Color(0xFF0E86D4)),
                          child: (Icon(Icons.arrow_forward_ios,
                              color: Colors.white))),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I'm a member, "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Login now",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
