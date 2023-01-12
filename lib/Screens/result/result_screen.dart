import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Future<String> getMosquitoType() async {
    String newMosquitoType = "";
    await FirebaseFirestore.instance
        .collection('mosquitotype')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        newMosquitoType = result.data()['type'];
      });
    });
    return newMosquitoType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: getMosquitoType(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
