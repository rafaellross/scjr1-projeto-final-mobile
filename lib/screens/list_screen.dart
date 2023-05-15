  import 'package:flutter/material.dart';
import 'package:scjr1_projeto_final_mobile/model/expense_model.dart';

import '../database_provider.dart';

  class ListScreen extends StatefulWidget {
    static const String id = '/splash_screen';

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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 1,
            leading: BackButton(
              color: Theme.of(context).secondaryHeaderColor,
              onPressed: () => Navigator.pop(context)
            ),

          ),
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: _expenses.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final expense = _expenses[index];
              return Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              expense.expenseName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Moeda Original: ${expense.expenseCurrency}",
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      );
    }

    Future<void> _loadExpenses() async {
      final expenses = await DBProvider.db.getAllExpenses();
      setState(() {
        _expenses = expenses;
      });
    }
  }