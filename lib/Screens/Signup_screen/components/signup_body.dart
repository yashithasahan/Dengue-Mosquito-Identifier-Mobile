// import 'package:flutter/material.dart';
// import 'package:mosquito_idnetifer/Screens/Login/components/login_body.dart';

// import '../../../Widgets/custom_textfield.dart';
// import '../../Home/home_screen.dart';

// class Signupbody extends StatefulWidget {
//   const Signupbody({super.key});

//   @override
//   State<Signupbody> createState() => _SignupbodyState();
// }

// class _SignupbodyState extends State<Signupbody> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmpasswordController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmpasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       height: size.height,
//       width: double.infinity,
//       child: Stack(
//         alignment: Alignment.center,
//         children: <Widget>[
//           Positioned(
//               top: 0,
//               child: Image.asset(
//                 "assets/images/login_combine.png",
//                 width: size.width * 1,
//               )),
//           const Positioned(
//               top: 65,
//               left: 15,
//               child: Text(
//                 "Hello!",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 50,
//                     color: Colors.white),
//               )),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CustomTextField(
//                 userIcon: const Icon(Icons.account_circle_rounded),
//                 myController: _emailController,
//                 userHintText: "Email",
//                 isPassword: false,
//                 errorTextEmpty: "Please Enter Your Email",
//               ),
//               CustomTextField(
//                 userIcon: const Icon(Icons.lock),
//                 myController: _passwordController,
//                 userHintText: "Password",
//                 isPassword: true,
//               ),
//               CustomTextField(
//                 userIcon: const Icon(Icons.lock),
//                 myController: _confirmpasswordController,
//                 userHintText: "Confirm Password",
//                 isPassword: true,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 30, left: 20, right: 20, bottom: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text("Sign up",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 40)),
//                     GestureDetector(
//                       onTap: (() {}),
//                       child: Container(
//                           height: 60,
//                           width: 60,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(45),
//                               color: const Color(0xFF0E86D4)),
//                           child: (Icon(Icons.arrow_forward_ios,
//                               color: Colors.white))),
//                     )
//                   ],
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("I'm a member, "),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text(
//                       "Login now",
//                       style: TextStyle(
//                           color: Colors.blue, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
