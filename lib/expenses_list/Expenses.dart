import 'package:flutter/material.dart';
import 'package:expense_tracker/models/Expense.dart';
import 'package:expense_tracker/expenses_list/Expenses_List.dart';
import 'package:google_fonts/google_fonts.dart';

import 'new_expense.dart';

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

  void _addExpense(){
    showModalBottomSheet(context: context, builder: (ctx) {
      return NewExpense();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker",style: GoogleFonts.poppins(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.purpleAccent,
        actions: [
          IconButton(
          icon: Icon(Icons.add),
          color: Colors.white,
          onPressed: _addExpense
          ),

        ],
      ),
      body: Column(
        children: [
          Text("Track Your Expenses..."),
          Expanded(child: Expenses_List(expenses_list: _registeredExpenses)),
        ],
      ),
    );
  }
}
