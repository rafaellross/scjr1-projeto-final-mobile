import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scjr1_projeto_final_mobile/screens/expense_screen.dart';
import 'package:scjr1_projeto_final_mobile/screens/list_screen.dart';
import 'package:scjr1_projeto_final_mobile/screens/login_screen.dart';
import 'package:scjr1_projeto_final_mobile/screens/register_screen.dart';
import 'package:scjr1_projeto_final_mobile/screens/splash_screen.dart';

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
      title: 'Controle de Gastos',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        ExpenseScreen.id: (context) => const ExpenseScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        SplashScreen.id: (context) => const SplashScreen(),
        ListScreen.id: (context) => const ListScreen(),
      },
    );
  }
}

