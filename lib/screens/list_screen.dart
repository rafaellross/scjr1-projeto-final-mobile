import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scjr1_projeto_final_mobile/model/expense_model.dart';
import 'package:scjr1_projeto_final_mobile/screens/expense_screen.dart';

import '../database_provider.dart';
import '../widgets/rounded_button.dart';

class ListScreen extends StatefulWidget {
  static const String id = '/list_screen';

  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<ExpenseModel> _expenses = [];


  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),

                itemCount: _expenses.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final expense = _expenses[index];
                  var f = NumberFormat("###.00", "pt_BR");
                  return ListTile(
                    tileColor: Colors.white,
                    textColor: Colors.black,
                    title: Text(expense.expenseName, style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    subtitle: Text("R\$ ${f.format(expense.expenseAmount)}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.black,
                            onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Apagar Gasto'),
                              content: const Text('Tem certeza que deseja excluir gasto?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _deleteExpense(expense);
                                    Navigator.pop(context, 'Excluir');
                                  },
                                  child: const Text('Excluir'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16), // Espaçamento entre o botão e o final da tela
            Padding(
              padding: const EdgeInsets.all(16.0), // Espaçamento em todos os lados do botão
              child: RoundedButton(
                text: 'Novo Gasto',
                onPressed: () => Navigator.pushNamed(context,ExpenseScreen.id),
                backgroundColor: Colors.white,
                textColor: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteExpense(ExpenseModel expense) async {
    await DBProvider.db.deleteExpense(expense);
    _loadExpenses();
  }
  
  Future<void> _loadExpenses() async {
    final expenses = await DBProvider.db.getAllExpenses();
    setState(() {
      _expenses = expenses;
    });
  }
}