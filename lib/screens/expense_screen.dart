  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scjr1_projeto_final_mobile/model/expense_model.dart';
import 'package:scjr1_projeto_final_mobile/screens/list_screen.dart';

  import '../database_provider.dart';
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

    String expenseName = '';
    double expenseAmount = 0.00;
    String expenseCurrency = '';
    String expenseNewCurrency = '';
    double expenseConvertedAmount = 0.00;


    @override
    Widget build(BuildContext context) {

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
                textInputType: const TextInputType.numberWithOptions(decimal: true),
                onTextChange: (newExpenseAmount) {
                  if (newExpenseAmount.isNotEmpty) {
                    expenseAmount = double.parse(newExpenseAmount);
                  } else {
                    expenseAmount = 0.0;
                  }
                },
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
                onTextChange: (newExpenseAmount) {
                  if (newExpenseAmount.isNotEmpty) {
                    expenseConvertedAmount = double.parse(newExpenseAmount);
                  } else {
                    expenseConvertedAmount = 0.0;
                  }
                },              ),
              const SizedBox(height: 10),
              RoundedButton(
                text: 'Salvar',
                onPressed: () => saveExpense(ExpenseModel(expenseName: expenseName, expenseAmount: expenseAmount, expenseCurrency: expenseCurrency, expenseNewCurrency: expenseNewCurrency, expenseConvertedAmount: expenseConvertedAmount))
            ),
              const SizedBox(height: 10),
              RoundedButton(
                text: 'Ver Gastos',
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListScreen())),
                backgroundColor: Colors.white,
                textColor: Colors.teal,

              ),

              const SizedBox(height: 10),
              RoundedButton(
                text: 'Logout', onPressed: () => _signOut(),
                backgroundColor: Colors.white,
                textColor: Colors.teal,

              ),
            ],
          ),
        ),
        ),
      );
    }

    Future<void> saveExpense(ExpenseModel newEXpense) async {
      await DBProvider.db.newExpense(newEXpense);
      Future.delayed(const Duration(seconds: 1)).then((_){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ListScreen()),
        );
      });

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