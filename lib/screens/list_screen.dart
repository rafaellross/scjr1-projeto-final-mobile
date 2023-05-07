  import 'package:flutter/material.dart';

  class ListScreen extends StatefulWidget {
    static const String id = '/splash_screen';

    const ListScreen({super.key});

    @override
    State<ListScreen> createState() => _ListScreenState();
  }

  class _ListScreenState extends State<ListScreen> {

    @override
    Widget build(BuildContext context) {
      var expenseName = '';
      var expenseAmount = '';
      var expenseCurrency = '';
      var expenseNewCurrency = '';
      var expenseConvertedAmount = '';
      return Scaffold(
        backgroundColor: Colors.blueAccent,
      );
    }
    }