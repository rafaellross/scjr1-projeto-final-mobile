import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scjr1_projeto_final_mobile/model/expense_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database? _database;

  Future<Database> get database async {
    _database ??= await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "expenses_database.db");

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE IF NOT EXISTS EXPENSE ("
              "id INTEGER PRIMARY KEY AUTOINCREMENT,"
              "expense_name TEXT,"
              "expense_amount REAL,"
              "expense_currency TEXT,"
              "expense_new_currency TEXT,"
              "expense_converted_amount REAL"
              ")");
        });
  }

  newExpense(ExpenseModel newExpense) async {
    final db = await database;
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into EXPENSE (expense_name,expense_amount,expense_currency, expense_new_currency, expense_converted_amount)"
            " VALUES (?,?,?,?,?)",
        [newExpense.expenseName, newExpense.expenseAmount, newExpense.expenseCurrency, newExpense.expenseNewCurrency, newExpense.expenseConvertedAmount]);
    return raw;
  }

  updateExpense(ExpenseModel newExpense) async {
    final db = await database;
    var res = await db.update("EXPENSE", newExpense.toMap(),
        where: "id = ?", whereArgs: [newExpense.id]);
    return res;
  }

  Future<List<ExpenseModel>> getAllExpenses() async {
    final db = await database;
    var res = await db.query("EXPENSE");
    List<ExpenseModel> list =
    res.isNotEmpty ? res.map((c) => ExpenseModel.fromMap(c)).toList() : [];
    return list;
  }

  deleteExpense(int id) async {
    final db = await database;
    return db.delete("EXPENSE", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("DELETE FROM EXPENSE");
  }
}