  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scjr1_projeto_final_mobile/screens/list_screen.dart';

  import '../widgets/rounded_button.dart';
  import '../widgets/rounded_text_field.dart';
import 'login_screen.dart';

  class ExpenseScreen extends StatefulWidget {
    static const String id = '/expense_screen';

    const ExpenseScreen({super.key});

    @override
    State<ExpenseScreen> createState() => _ExpenseScreenState();
  }

  class _ExpenseScreenState extends State<ExpenseScreen> {

    @override
    Widget build(BuildContext context) {

      var expenseName = '';
      var expenseAmount = '';
      var expenseCurrency = '';
      var expenseNewCurrency = '';
      var expenseConvertedAmount = '';

      return Scaffold(
          backgroundColor: Colors.blueAccent,
        body: SafeArea(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('assets/images/log_background.png',),
             height: 80,
              ),
              const SizedBox(height: 10),
              RoundedTextField(
                hint: 'Gasto',
                onTextChange: (newExpenseName) => expenseName = newExpenseName,
              ),
              const SizedBox(height: 10),
              RoundedTextField(
                hint: 'Valor',
                onTextChange: (newExpenseAmount) => expenseAmount = newExpenseAmount,
              ),
              const SizedBox(height: 10),
              RoundedTextField(
                hint: 'Moeda Original',
                onTextChange: (newExpenseCurrency) => expenseCurrency = newExpenseCurrency,
              ),
              const SizedBox(height: 10),
              RoundedTextField(
                hint: 'Moeda a Converter',
                onTextChange: (newExpenseNewCurrency) => expenseNewCurrency = newExpenseNewCurrency,
              ),
              const SizedBox(height: 10),
              RoundedTextField(
                hint: 'Valor Convertido',
                onTextChange: (newExpenseConvertedAmount) => expenseConvertedAmount = newExpenseConvertedAmount,
              ),
              const SizedBox(height: 10),
              RoundedButton(
                text: 'Salvar', onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ListScreen()));
              },

            ),
              const SizedBox(height: 10),
              RoundedButton(
                text: 'Logout', onPressed: () => _signOut(),
              ),
            ],
          ),
        ),
        ),
      );
    }

    Future<void> _signOut() async {
      await FirebaseAuth.instance.signOut().then((value) => {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        )
      });

    }
  }