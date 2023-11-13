import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/assets/Storage/temp/todo.dart';

class DoItem extends StatefulWidget {
  const DoItem({super.key, required this.current, required this.doIcon});

  final todo current;
  final Icon doIcon;

  @override
  State<DoItem> createState() => _DoItemState();
}

class _DoItemState extends State<DoItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      child: TextButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(),
            shadowColor: Colors.grey),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.circle_outlined,
              ),
            ),
            Text(
              widget.current.title,
              style: GoogleFonts.inter(
                color: Colors.black,
              ),
            ),
            const Spacer(), widget.doIcon,
            // IconButton(onPressed: () {}, icon: widget.doIcon)
          ],
        ),
      ),
    );
  }
}
