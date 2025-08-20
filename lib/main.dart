import 'package:flutter/material.dart';

import 'expenses_list/Expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
void main(){
  runApp(
       MaterialApp(
        theme: ThemeData().copyWith(
          useMaterial3: true,
          scaffoldBackgroundColor: Color.fromARGB(255, 220, 189, 252),
          colorScheme:kColorScheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          )
        ),
        debugShowCheckedModeBanner: false,
    home: Expenses(),
  ));
}