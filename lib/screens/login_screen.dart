import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:scjr1_projeto_final_mobile/screens/expense_screen.dart';
import 'package:scjr1_projeto_final_mobile/screens/register_screen.dart';
import '../widgets/rounded_button.dart';
import '../widgets/rounded_text_field.dart';
import 'list_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login';

  LoginScreen({super.key});

  var userEmail = '';
  var userPassword = '';

  @override
  Widget build(BuildContext context) {

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
              const Text(
                'Login',
                textAlign: TextAlign.center
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
                text: 'Entrar', onPressed: () => makeLogin(context),
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

  void makeLogin(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;

    firebaseAuth
        .signInWithEmailAndPassword(
      email: userEmail,
      password: userPassword,
    )
        .then(
          (userCredentials) {
        Navigator.pushReplacementNamed(context, ExpenseScreen.id);
      },
    ).onError(
          (error, stackTrace) {
            print(error);
            Navigator.pushNamed(context, RegisterScreen.id);
      },
    );
  }

}