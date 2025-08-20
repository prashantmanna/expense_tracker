import 'package:flutter/material.dart';

import 'expenses_list/Expenses.dart';

void main(){
  runApp(
       MaterialApp(
        theme: ThemeData().copyWith(
          useMaterial3: true,
          scaffoldBackgroundColor: Color.fromARGB(255, 220, 189, 252)
        ),
        debugShowCheckedModeBanner: false,
    home: Expenses(),
  ));
}