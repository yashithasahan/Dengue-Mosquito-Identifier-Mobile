import 'package:flutter/material.dart';
import 'package:mosquito_idnetifer/Screens/Main_screen/main_screen.dart';
import 'Auth/main_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDS7rjh9h9qsIJVPvnPJd5kz0B2KsHC15E",
        authDomain: "mosquito-identifier.firebaseapp.com",
        projectId: "mosquito-identifier",
        storageBucket: "mosquito-identifier.appspot.com",
        messagingSenderId: "849276650318",
        appId: "1:849276650318:web:78ae0e1ea440f29e91541f"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        '/homepage': (context) => const MainScreen(),
        
      },
      home: const MainPage(),
    );
  }
}
