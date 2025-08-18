import 'package:flutter/material.dart';
import 'package:expense_tracker/models/Expense.dart';
import 'package:expense_tracker/expenses_list/Expenses_List.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Movie",
      amount: 30.00,
      date: DateTime.now(),
      category: Category.entertainment,
    ),
    Expense(
      title: "Travel",
      amount: 50.00,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Welcome to Expense Tracker"),
          Expanded(child: Expenses_List(expenses_list: _registeredExpenses)),
        ],
      ),
    );
  }
}
