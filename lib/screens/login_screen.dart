import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../widgets/rounded_button.dart';
import '../widgets/rounded_text_field.dart';
import 'list_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login';

  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var userEmail = '';
    var userPassword = '';

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('assets/images/log_background.png',),
              ),
                    RoundedTextField(
                      hint: 'Email',
                      onTextChanged: (newEmail) => userEmail = newEmail,
                    ),
                    const SizedBox(height: 20),
                    RoundedTextField(
                      hint: 'Senha',
                      onTextChanged: (newPassword) => userPassword = newPassword,
                    ),
                    const SizedBox(height: 32.0),
                    RoundedButton(
                      text: 'Entrar', onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ListScreen()));
                    },
                      // onPressed: () => makeLogin(
                      //   context,
                      //   userEmail,
                      //   userPassword,
                      // ),
                    ),
                  ],
          ),
        ),
      ),
    );
  }

  void makeLogin(BuildContext context, String email, String password) async {


    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //Navigator.pushReplacementNamed(context, MoviesScreen.id);
    } catch (error) {
      makeRegister(context, email, password);
    }
  }

  void makeRegister(BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //Navigator.pushReplacementNamed(context, MoviesScreen.id);
    } catch (error) {
      print(error);
    }
  }
}