import 'package:flutter/material.dart';

import '../../Storage/temp/todo.dart';

class ChangeTitle extends StatelessWidget {
  ChangeTitle({super.key, required this.currentdo});

  final TextEditingController title = TextEditingController();
  final todo currentdo;

  void dispose() {
    title.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: AlertDialog(
          scrollable: true,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 16, 16, 16),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              side: BorderSide(color: Color.fromARGB(255, 247, 239, 229))),
          actions: [
            const SizedBox(
              height: 40,
            ),
            TextField(
              style: const TextStyle(
                color: Color.fromARGB(255, 247, 239, 229),
              ),
              cursorColor: Colors.white,
              onTapOutside: (context) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: const InputDecoration(hintText: "NEW TITLE"),
              controller: title,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 40,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 100,
                  height: 40,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: TextButton(
                    onPressed: () {
                      currentdo.title = title.text.toUpperCase();
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
