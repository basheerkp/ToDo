import 'package:flutter/material.dart';
import 'package:todo/assets/Storage/temp/todo.dart';

class NewDo extends StatefulWidget {
  const NewDo({super.key, required this.addtodo});

  final Function addtodo;

  @override
  State<StatefulWidget> createState() {
    return _StateNewDo();
  }
}

class _StateNewDo extends State<NewDo> {
  TextEditingController title = TextEditingController();

  Timer timely = Timer.onetime;

  var cat = cats.chore;

  var overlayEntry = OverlayEntry(
    builder: (BuildContext context) {
      return Container(
        alignment: Alignment.bottomCenter,
        child: Dismissible(
          key: const Key("xyz"),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            alignment: Alignment.center,
            height: 70,
            child: Text(
              "title can not be null".toUpperCase(),
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      );
    },
  );

  @override
  void dispose() {
    super.dispose();
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
              decoration: const InputDecoration(hintText: "Task"),
              controller: title,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Text(
                  "Recurrence",
                ),
                const Spacer(),
                DropdownMenu(
                  width: MediaQuery.sizeOf(context).width / 2,
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: Timer.daily, label: "Daily"),
                    DropdownMenuEntry(value: Timer.weekly, label: "Weekly"),
                    DropdownMenuEntry(value: Timer.monthly, label: "Monthly"),
                    DropdownMenuEntry(value: Timer.yearly, label: "Yearly"),
                    DropdownMenuEntry(value: Timer.onetime, label: "Only Once"),
                  ],
                  initialSelection: Timer.onetime,
                  onSelected: (value) => {timely = (value ?? timely)},
                ),
              ],
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
                      if (title.text.isEmpty) {
                        Overlay.of(context).insert(overlayEntry);
                        Future.delayed(const Duration(seconds: 3), () {
                          overlayEntry.remove();
                        });
                      } else {
                        widget.addtodo(
                          todo(
                              title.text.toUpperCase(),
                              timely,
                              [
                                Timer.yearly,
                                Timer.monthly,
                                Timer.weekly,
                                Timer.daily
                              ].contains(timely)
                                  ? cats.chore
                                  : cats.bucketList),
                        );
                        Navigator.of(context).pop();
                      }
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
