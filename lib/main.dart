import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'expenses_list/Expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
);
var darkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 5, 99, 125),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]).then((fn){
    runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: darkColorScheme,
          useMaterial3: true,
          cardTheme: CardThemeData().copyWith(
            color: Colors.purpleAccent,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: darkColorScheme.onPrimaryContainer,
            foregroundColor: darkColorScheme.primaryContainer,
          ),
        ),
        theme: ThemeData().copyWith(
            useMaterial3: true,
            scaffoldBackgroundColor: Color.fromARGB(255, 220, 189, 240),
            // inputDecorationTheme: const InputDecorationTheme(
            //   labelStyle: TextStyle(color: Colors.black),
            //   counterStyle: TextStyle(color: Colors.black),
            // ),
            colorScheme: kColorScheme,
            appBarTheme: AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onPrimaryContainer,
              foregroundColor: kColorScheme.primaryContainer,
            ),
            cardTheme: CardThemeData().copyWith(
              color: Colors.purpleAccent,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.primaryContainer,
              ),
            ),
            // textTheme: TextTheme(
            //     bodyMedium: TextStyle(
            //         color: Colors.black
            //     )
            // )
        ),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: Expenses(),
      ),
    );
  });

}
