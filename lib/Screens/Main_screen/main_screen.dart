import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mosquito_idnetifer/Screens/Account/account_screen.dart';
import 'package:mosquito_idnetifer/Screens/Analytics/analytics_screen.dart';
import 'package:mosquito_idnetifer/Screens/Home/components/home_body.dart';
import 'package:mosquito_idnetifer/Screens/Home/home_screen.dart';
import 'package:mosquito_idnetifer/Screens/map/map_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 1;
  double bottomBarWidth = 40;
  double bottomBarBorderWidth = 3;

  List<Widget> pages = [
    const MapScreen(),
    const AnalyticsScreen(),
    const HomeBody(),
    const AccountScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Welcome! ${user.email}"),
        flexibleSpace: Container(),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: const Color.fromARGB(255, 8, 75, 130),
        unselectedItemColor: Colors.blue,
        backgroundColor: Colors.red,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: _page == 0 ? Colors.blue : Colors.white,
                      width: bottomBarBorderWidth),
                ),
              ),
              child: const Icon(
                Icons.map,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: _page == 1 ? Colors.blue : Colors.white,
                      width: bottomBarBorderWidth),
                ),
              ),
              child: const Icon(
                Icons.analytics,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: _page == 2 ? Colors.blue : Colors.white,
                      width: bottomBarBorderWidth),
                ),
              ),
              child: const Icon(
                Icons.search,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: _page == 3 ? Colors.blue : Colors.white,
                      width: bottomBarBorderWidth),
                ),
              ),
              child: const Icon(
                Icons.person_outline,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
