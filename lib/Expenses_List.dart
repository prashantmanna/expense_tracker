import 'package:expense_tracker/Expenses.dart';
import 'package:flutter/cupertino.dart';

import 'models/Expense.dart';

class Expenses_List extends StatelessWidget{
  const Expenses_List({super.key , required this.expenses_list});

  final List<Expense> expenses_list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses_list.length,
      itemBuilder: (context,index)=> Text(expenses_list[index].title),
    );
  }

}