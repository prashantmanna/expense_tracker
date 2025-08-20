import 'package:expense_tracker/expenses_list/Expenses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Expense.dart';
import 'expenses_item.dart';

class Expenses_List extends StatelessWidget {
  const Expenses_List({super.key, required this.expenses_list,required this.onRemove});

  final List<Expense> expenses_list;
  final void Function(Expense expense) onRemove;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses_list.length,
      itemBuilder: (context, index) =>
          Dismissible(
              key: ValueKey(expenses_list[index]),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.6),
                margin:
                EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal,
                )

              ),
              onDismissed: (direction){
                onRemove(expenses_list[index]);
              },
              child: ExpensesItem(expenses_list[index]))
    );
  }

}