import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scjr1_projeto_final_mobile/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash_screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Future.delayed(const Duration(seconds: 4)).then((_){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
    });
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
}
