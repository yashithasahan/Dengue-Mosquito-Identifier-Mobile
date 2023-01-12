import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AnalyticsScreenBody extends StatefulWidget {
  const AnalyticsScreenBody({super.key});

  @override
  State<AnalyticsScreenBody> createState() => _AnalyticsScreenBodyState();
}

class _AnalyticsScreenBodyState extends State<AnalyticsScreenBody> {
  final user = FirebaseAuth.instance.currentUser!;
  int total = 8;
  int totalUser = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      height: 150,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 15,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 3,
                            ),
                            const Text(
                              "Total Scanned",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('mosquito')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const CircularProgressIndicator();
                                }
                                return Text('${snapshot.data?.size}',
                                    style: const TextStyle(
                                        fontSize: 60,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold));
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      height: 150,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 15,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration:
                                        const BoxDecoration(color: Colors.red),
                                  ),
                                  const Text(
                                    "Aedes Aegypti",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.blue),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                        color: Colors.yellow),
                                  ),
                                  const Text(
                                    "Aedes Alpobictes",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.blue),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              CircularPercentIndicator(
                                radius: 40.0,
                                animation: true,
                                animationDuration: 1200,
                                lineWidth: 15.0,
                                percent: 0.4,
                                circularStrokeCap: CircularStrokeCap.butt,
                                backgroundColor: Colors.yellow,
                                progressColor: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      height: 150,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 15,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                              "Your Total Scans",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('mosquito')
                                  .where("userId", isEqualTo: user.uid)
                                  .snapshots(),
                              builder: (context, snapshotuser) {
                                if (!snapshotuser.hasData) {
                                  return const CircularProgressIndicator();
                                }
                                return Text('${snapshotuser.data?.size}',
                                    style: const TextStyle(
                                        fontSize: 60,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold));
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      height: 150,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 15,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                              "Personal Contribution",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text("${(total / totalUser).toString()} %",
                                style: const TextStyle(
                                    fontSize: 50,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: (MediaQuery.of(context).size.width) - 20,
                  height: 1000,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 6),
                          const Text("Ampara"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.8,
                            backgroundColor:
                                const Color.fromARGB(255, 151, 208, 255),
                            progressColor: Colors.blue,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Anuradapura"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.7,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Badulla"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.5,
                            backgroundColor:
                                const Color.fromARGB(255, 151, 208, 255),
                            progressColor: Colors.blue,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Batticaloa"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.6,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Colombo"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.7,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Galle"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.1,
                            backgroundColor:
                                const Color.fromARGB(255, 151, 208, 255),
                            progressColor: Colors.blue,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Gampaha"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.6,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Hambantota"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.7,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Jaffna"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.1,
                            backgroundColor:
                                const Color.fromARGB(255, 151, 208, 255),
                            progressColor: Colors.blue,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Kalutara"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.5,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Kandy"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.6,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Kegalle"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.7,
                            backgroundColor:
                                const Color.fromARGB(255, 151, 208, 255),
                            progressColor: Colors.blue,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Kilinochchi"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.8,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Kurunegala"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.5,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Mannar"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.2,
                            backgroundColor:
                                const Color.fromARGB(255, 151, 208, 255),
                            progressColor: Colors.blue,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Matale"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.3,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Matara"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.6,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Moneragala"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.7,
                            backgroundColor:
                                const Color.fromARGB(255, 151, 208, 255),
                            progressColor: Colors.blue,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Mullaitivu"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.45,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Nuwara Eliya"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.52,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Polonnaruwa"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.7,
                            backgroundColor:
                                const Color.fromARGB(255, 151, 208, 255),
                            progressColor: Colors.blue,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Puttalam"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.36,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Ratnapura"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.54,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Trincomalee"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.27,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Vavuniya"),
                          const SizedBox(height: 2),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 1200,
                            percent: 0.43,
                            backgroundColor:
                                const Color.fromARGB(255, 158, 255, 162),
                            progressColor: Colors.green,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

//   getAverage() {
//     if (total == null || totalUser == null) {
//       print(total);
//       print(totalUser);
//     } else {
//       print(total);
//       print(totalUser);
//     }
//   }
//
}
