import 'package:flutter/material.dart';

import 'assets/Home/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromARGB(255, 16, 16, 16),
          appBarTheme: const AppBarTheme(
              color: Color.fromARGB(255, 16, 16, 16),
              foregroundColor: Color.fromARGB(255, 247, 239, 229)),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color.fromARGB(255, 247, 239, 229)),
          ),
          hintColor: Colors.white,
          dropdownMenuTheme: const DropdownMenuThemeData(
            textStyle: TextStyle(
              color: Color.fromARGB(255, 247, 239, 229),
            ),
          ),
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStatePropertyAll(
                      TextStyle(color: Color.fromARGB(255, 247, 239, 229)))))),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ),
  );
}
