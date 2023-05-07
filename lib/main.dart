import 'package:flutter/material.dart';
import 'package:scjr1_projeto_final_mobile/screens/expense_screen.dart';
import 'package:scjr1_projeto_final_mobile/screens/login_screen.dart';
import 'package:scjr1_projeto_final_mobile/screens/splash_screen.dart';

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
        ExpenseScreen.id: (context) => const ExpenseScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        SplashScreen.id: (context) => const SplashScreen(),

      },
    );
  }
}

