import 'package:flutter/material.dart';
import 'package:learning_10c/modules/auth/login.dart';
import 'package:learning_10c/modules/auth/register.dart';
import 'package:learning_10c/navigation/navigation.dart';
import 'package:learning_10c/navigation/profile.dart';
import 'package:learning_10c/navigation/reservations.dart';
import 'package:learning_10c/navigation/top.dart';
import 'package:learning_10c/navigation/home.dart';
import 'package:learning_10c/widgets/home/detail_restaurant.dart';
import 'package:learning_10c/widgets/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/home': (context) => const Home(),
        '/menu': (context) => const Navigation(),
        '/top': (context) => Top(),
        '/profile': (context) => const Profile(),
        '/reservations': (context) => const Reservations(),
      },
    );
  }
}
