import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/assets/Storage/temp/todo.dart';

class DoItem extends StatefulWidget {
  const DoItem({
    super.key,
    required this.current,
    required this.doIcon,
    required this.number,
    required this.donefunction,
  });

  final void Function(int index) donefunction;
  final int number;
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
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                widget.donefunction(widget.number);
              },
              icon: const Icon(
                Icons.circle_outlined,
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.current.title,
                style: GoogleFonts.inter(
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(
                  Colors.blue,
                ),
              ),
              child: Text(widget.current.timer.toString().substring(6)),
            ),
            const SizedBox(
              width: 40,
            ),
            IconButton(
              icon: widget.doIcon,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
