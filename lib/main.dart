import 'package:flutter/material.dart';

import 'assets/Home/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          elevatedButtonTheme: const ElevatedButtonThemeData(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7))))))),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ),
  );
}
