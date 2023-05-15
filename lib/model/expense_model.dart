import 'dart:ffi';

class ExpenseModel {
  int? id;
  String expenseName;
  double expenseAmount;
  String expenseCurrency;
  String expenseNewCurrency;
  double expenseConvertedAmount;

  ExpenseModel({
    this.id,
    required this.expenseName,
    required this.expenseAmount,
    required this.expenseCurrency,
    required this.expenseNewCurrency,
    required this.expenseConvertedAmount,
  });



  factory ExpenseModel.fromMap(Map<String, dynamic> json) => ExpenseModel(
    id: json["id"],
    expenseName: json["expense_name"],
    expenseAmount: json["expense_amount"],
    expenseCurrency: json["expense_currency"],
    expenseNewCurrency: json["expense_new_currency"],
    expenseConvertedAmount: json["expense_converted_amount"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "expense_name": expenseName,
    "expense_amount": expenseAmount,
    "expense_currency": expenseCurrency,
    "expense_new_currency": expenseNewCurrency,
    "expense_converted_amount": expenseConvertedAmount,
  };


}
