import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mosquito_idnetifer/Screens/Welcome/welcome_screen.dart';
import 'package:mosquito_idnetifer/Widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

import '../../result/result_screen.dart';

class HomeBody extends StatefulWidget {
  
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String selectedImagePath = '';
  String district = "Ampara";
  bool? haveimage;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> districts = [
      'Ampara',
      'Anuradhapura',
      "Badulla",
      "Batticaloa",
      "Colombo",
      "Galle",
      "Gampaha",
      "Hambantota",
      "Jaffna",
      "Kalutara",
      "Kandy",
      "Kegalle",
      "Kilinochchi",
      "Kurunegala",
      "Mannar",
      "Matale",
      "Matara",
      "Moneragala",
      "Mullaitivu",
      "Nuwara Eliya",
      "Polonnaruwa",
      "Puttalam",
      "Ratnapura",
      "Trincomalee",
      "Vavuniya",
    ];
    
    
    final user = FirebaseAuth.instance.currentUser!;
    Map<String, dynamic> newData = {
      'district': district,
      'time': DateTime.now(),
      'type': 'A',
      'userId': user.uid,
    };

    return SingleChildScrollView(
      child: Container(
          child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              child: Image.asset(
                "assets/images/Frame3.jpg",
                width: size.width * 1,
              )),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                selectedImagePath == ''
                    ? Container(
                        width: 350,
                        height: 150,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const SizedBox(width: 20.0, height: 100.0),
                            const Text(
                              'BE',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 43.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 20.0, height: 100.0),
                            DefaultTextStyle(
                              style: const TextStyle(
                                  fontSize: 40.0,
                                  fontFamily: 'Horizon',
                                  fontWeight: FontWeight.bold),
                              child: AnimatedTextKit(
                                isRepeatingAnimation: true,
                                totalRepeatCount: 100,
                                animatedTexts: [
                                  RotateAnimatedText('PRECISELY'),
                                  RotateAnimatedText('ACCURATIZE'),
                                  RotateAnimatedText('EFFICIENTLY'),
                                  RotateAnimatedText('RELIABLE'),
                                  RotateAnimatedText('FAULTLESS'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Card(
                        elevation: 20,
                        child: Image.file(
                          File(selectedImagePath),
                          height: 350,
                          width: 350,
                          fit: BoxFit.fill,
                        ),
                      ),
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  "Select your district",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.2, color: Colors.blue),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: DropdownButton(
                      dropdownColor: const Color.fromARGB(255, 173, 229, 255),
                      value: district,
                      items: districts.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newDistrict) {
                        setState(() {
                          district = newDistrict!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  buttonText: "Add an Image",
                  textColor: Colors.white,
                  onPressed: () {
                    selectImage();
                  },
                  buttonColor: Colors.blue,
                ),
                CustomButton(
                  buttonText: "Scan",
                  textColor: Colors.white,
                  onPressed: () {
                    if (haveimage == true) {
                      FirebaseFirestore.instance
                          .collection('mosquito')
                          .add(newData);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(),
                          ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                '⚠️',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Color.fromARGB(255, 255, 170, 0),
                                    fontWeight: FontWeight.bold),
                              ),
                              content: const Text('Please add image'),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    }
                  },
                  buttonColor: Colors.green,
                ),
                const SizedBox(
                  height: 220,
                ),
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      iconSize: 20,
                      color: Colors.white,
                      onPressed: (() {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Log out'),
                              content: const Text(
                                  'Are you sure you want to log out?'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Yes'),
                                  onPressed: () {
                                    // Log out the user
                                    FirebaseAuth.instance.signOut();
    
                                    // Close the dialog
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const WelcomeScreen()));
                                  },
                                ),
                                TextButton(
                                  child: const Text('No'),
                                  onPressed: () {
                                    // Close the dialog
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }),
                      icon: const Icon(Icons.logout_rounded),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'Select an Image ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromGallery();

                            if (selectedImagePath != '') {
                              haveimage = true;
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      content: Text("No image selected !"),
                                    );
                                  });
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/gallery.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    const Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromCamera();

                            if (selectedImagePath != '') {
                              haveimage = true;
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      content: Text("No image captured !"),
                                    );
                                  });
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/camera.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    const Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  //
  selectImageFromCamera() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}








