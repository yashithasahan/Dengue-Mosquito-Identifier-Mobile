import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Welcome/welcome_screen.dart';

class AccountBody extends StatefulWidget {
  const AccountBody({super.key});

  @override
  State<AccountBody> createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            const Spacer(),
            IconButton(
              iconSize: 40,
              color: Colors.black,
              onPressed: (() {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Log out'),
                      content: const Text('Are you sure you want to log out?'),
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
      ]),
    );
  }
}
