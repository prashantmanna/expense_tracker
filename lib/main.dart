import 'package:flutter/material.dart';

import 'expenses_list/Expenses.dart';

void main(){
  runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
    home: Expenses(),
  ));
}