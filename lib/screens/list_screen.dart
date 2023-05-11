  import 'package:flutter/material.dart';
import 'package:scjr1_projeto_final_mobile/model/expense_model.dart';

  class ListScreen extends StatefulWidget {
    static const String id = '/splash_screen';

    const ListScreen({super.key});

    @override
    State<ListScreen> createState() => _ListScreenState();
  }

  class _ListScreenState extends State<ListScreen> {



    @override
    Widget build(BuildContext context) {
      final List<ExpenseModel> expenseList = [
        const ExpenseModel (
            expenseName: "expenseName",
            expenseAmount: 100.00,
            expenseCurrency: "USD",
            expenseNewCurrency: "BRL",
            expenseConvertedAmount: 500.00
        ),
        const ExpenseModel (
            expenseName: "expenseName",
            expenseAmount: 100.00,
            expenseCurrency: "USD",
            expenseNewCurrency: "BRL",
            expenseConvertedAmount: 500.00
        ),
        const ExpenseModel (
            expenseName: "expenseName",
            expenseAmount: 100.00,
            expenseCurrency: "USD",
            expenseNewCurrency: "BRL",
            expenseConvertedAmount: 500.00
        ),

      ];
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
            itemCount: expenseList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final expense = expenseList[index];
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
                              expense.expenseCurrency,
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
  }