import 'package:flutter/material.dart';

class MyStyledContainer extends StatelessWidget {
  const MyStyledContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: child,
    );
  }
}
