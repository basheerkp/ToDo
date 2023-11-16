import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/assets/Home/data%20IO/repeatchanger.dart';
import 'package:todo/assets/Home/data%20IO/titlechange.dart';
import 'package:todo/assets/Storage/temp/todo.dart';

class DoItem extends StatefulWidget {
  DoItem({
    super.key,
    required this.current,
    required this.doIcon,
    required this.number,
    required this.donefunction,
  });

  final void Function(int index) donefunction;
  final int number;
  todo current;
  final IconData doIcon;

  @override
  State<DoItem> createState() => _DoItemState();
}

class _DoItemState extends State<DoItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 247, 239, 229))),
      duration: const Duration(seconds: 2),
      child: TextButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return ChangeTitle(currentdo: widget.current);
              });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 16, 16, 16),
          shape: const RoundedRectangleBorder(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                widget.donefunction(widget.number - 1);
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
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () async {
                await showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return ChangeTimer(
                        currentdo: widget.current,
                      );
                    });
                setState(() {
                  widget.current = widget.current;
                });
              },
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(
                  Colors.white,
                ),
              ),
              child: Row(
                children: [
                  Text(widget.current.timer
                      .toString()
                      .substring(6)
                      .toUpperCase()),
                  Icon(
                    widget.doIcon,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
