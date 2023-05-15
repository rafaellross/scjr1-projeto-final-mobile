import 'dart:ffi';

class ExpenseModel {
  int? id;
  String expenseName;
  double expenseAmount;
  DateTime expenseDate;
  bool expensePaid;

  ExpenseModel({
    this.id,
    required this.expenseName,
    required this.expenseAmount,
    required this.expenseDate,
    required this.expensePaid
  });



  factory ExpenseModel.fromMap(Map<String, dynamic> json) => ExpenseModel(
    id: json["id"],
    expenseName: json["expense_name"],
    expenseAmount: json["expense_amount"],
    expenseDate: DateTime.parse(json["expense_date"]),
    expensePaid: json["expense_paid"] == 1
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "expense_name": expenseName,
    "expense_amount": expenseAmount,
    "expense_date": expenseDate,
    "expense_paid": expensePaid ? 1 : 0
  };


}
