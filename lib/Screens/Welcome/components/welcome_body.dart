import 'package:flutter/material.dart';
import 'package:mosquito_idnetifer/Screens/Login/login_screen.dart';
import 'package:mosquito_idnetifer/Screens/Signup_screen/components/signup_body.dart';
import 'package:mosquito_idnetifer/Screens/Signup_screen/components/signup_body.dart';
import 'package:mosquito_idnetifer/Screens/Signup_screen/signupscreen.dart';
import 'package:mosquito_idnetifer/Widgets/custom_button.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/welcome_top.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/welcome_bottom.png",
              width: size.width * 0.7,
            ),
          ),
          Positioned(
            child: Image.asset(
              "assets/images/welcome_center.png",
              width: size.width * 1,
            ),
          ),
          Positioned(
            top: 300,
            child: Image.asset(
              "assets/images/welcome_center_main.png",
              width: size.width * 0.7,
            ),
          ),
          const Positioned(
              top: 100,
              child: Text(
                "Welcome!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
              )),
          const Positioned(
              top: 160,
              child: Text(
                "To Mosquito Identifier",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Color(0xFF9DA6B0)),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                buttonText: "Login",
                buttonColor: Color(0xFF68CAF1),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
              ),
              CustomButton(
                buttonText: "Register",
                buttonColor: Color(0xFF0E86D4),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => signupscreen()));
                },
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}

// class BodyCenter extends StatelessWidget {
//   const BodyCenter({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             "Welcome",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//           ),
//           Text(
//             "To Mosquito Identifier",
//             style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11),
//           ),
//         ],
//       ),
//     );
//   }
// }
