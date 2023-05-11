import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:scjr1_projeto_final_mobile/screens/expense_screen.dart';
import '../widgets/rounded_button.dart';
import '../widgets/rounded_text_field.dart';
import 'list_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = 'register';

  const RegisterScreen({Key? key}) : super(key: key);


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
              const Text(
                  'Cadastro',
                  textAlign: TextAlign.center
              ),
              const SizedBox(height: 20),
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
                      text: 'Cadastrar', onPressed: () {
                      makeRegister(context,userEmail,userPassword);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                    },
                      // onPressed: () => makeRegister(
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