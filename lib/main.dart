import 'package:flutter/material.dart';

import 'expenses_list/Expenses.dart';

void main(){
  runApp(
       MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
    home: Expenses(),
  ));
}