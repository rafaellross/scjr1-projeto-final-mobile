  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

    late String expenseName;
    late double expenseAmount;
    TextEditingController _dateController = TextEditingController();
    DateTime _selectedDate = DateTime.now();
    bool _isPaid = false;

    @override
    Widget build(BuildContext context) {
      _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate);
      return Scaffold(
          backgroundColor: Colors.blueAccent,
        body: SafeArea(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                child: Image.asset('assets/images/log_background.png')
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
              TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),

                controller: _dateController,
                decoration: InputDecoration(
                  hintText: 'Selecione a data',
                  labelStyle: const TextStyle(
                      color: Colors.white
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1000),

                  ),

                ),
                onTap: () async {
                  _selectedDate = (await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),

                  ))!;

                  if (_selectedDate != null) {
                    _dateController.text = DateFormat.yMd().format(_selectedDate);
                  }
                },
              ),
              const SizedBox(height: 10),

              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: _isPaid,
                    onChanged: (bool? value) {
                      setState(() {
                        _isPaid = value ?? false;
                      });
                    },
                    checkColor: Colors.white,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                  const Text(
                    'Pago?',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              RoundedButton(
                text: 'Salvar',
                onPressed: () => saveExpense(ExpenseModel(expenseName: expenseName, expenseAmount: expenseAmount, expenseDate: _selectedDate, expensePaid: _isPaid))
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
      print("Expense paid");
      print(newEXpense.expensePaid);
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