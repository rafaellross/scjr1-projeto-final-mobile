import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scjr1_projeto_final_mobile/screens/expense_screen.dart';
import 'package:scjr1_projeto_final_mobile/screens/list_screen.dart';
import 'package:scjr1_projeto_final_mobile/screens/login_screen.dart';
import 'package:scjr1_projeto_final_mobile/screens/register_screen.dart';

import 'expense_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash_screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    _checkCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.indigo[900],
        child: Image.asset('assets/images/splash_background.png', fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,),
    );
  }

  void _checkCurrentUser() async {


    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {

      Future.delayed(const Duration(seconds: 2)).then((_){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ListScreen()),
        );
      });

    } else {

      Future.delayed(const Duration(seconds: 2)).then((_){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      });

    }
  }
}
