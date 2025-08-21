import 'package:expense_tracker/chart/chart.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/Expense.dart';
import 'package:expense_tracker/expenses_list/Expenses_List.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
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
    showModalBottomSheet(
        isScrollControlled: true,
        context: context, builder: (ctx) => NewExpense(onAddExpense: _addExpenses));

  }

  void _addExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense){
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Expense Deleted Successfully !!"),
      duration: Duration(seconds: 3),
      action: SnackBarAction(label: "Undo", onPressed: (){
        setState(() {
          _registeredExpenses.insert(expenseIndex,expense);}
          );
        },
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    Widget mainContent = Center(
      child: Text("No Expenses Found. Start Adding Some!",
          style: Theme.of(context).textTheme.titleLarge)
    );


    if(_registeredExpenses.isNotEmpty){
      mainContent = Expenses_List(expenses_list: _registeredExpenses,onRemove: removeExpense);
    };
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker",style: GoogleFonts.poppins(
          fontSize: 25,
          color: Colors.white.withOpacity(0.4),
          fontWeight: FontWeight.bold,
        ),),
        // backgroundColor: Colors.purpleAccent,
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
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
