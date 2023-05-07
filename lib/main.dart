import 'package:flutter/material.dart';
import 'package:scjr1_projeto_final_mobile/screens/home_screen.dart';
import 'package:scjr1_projeto_final_mobile/screens/login_screen.dart';
import 'package:scjr1_projeto_final_mobile/screens/splash_screen.dart';
import 'package:scjr1_projeto_final_mobile/screens/splash_screen3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        SplashScreen.id: (context) => const SplashScreen(),

      },
    );
  }
}

