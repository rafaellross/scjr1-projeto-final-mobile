import 'dart:ffi';

class ExpenseModel {
  const ExpenseModel({
    required this.expenseName,
    required this.expenseAmount,
    required this.expenseCurrency,
    required this.expenseNewCurrency,
    required this.expenseConvertedAmount,

  });

  final String expenseName;
  final double expenseAmount;
  final String expenseCurrency;
  final String expenseNewCurrency;
  final double expenseConvertedAmount;

}
