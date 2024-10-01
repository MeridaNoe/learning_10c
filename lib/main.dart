import 'package:flutter/material.dart';
import 'package:learning_10c/navigation/profile.dart';
import 'package:learning_10c/navigation/reservations.dart';
import 'package:learning_10c/navigation/top.dart';
import 'package:learning_10c/navigation/home.dart';
import 'package:learning_10c/widgets/splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
        '/top': (context) =>  Top(),
        '/profile': (context) => const Profile(),
        '/reservations': (context) => const Reservations(),
      },
    );
  }
}