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

  var timely = Timer.daily;

  var cat = cats.chore;

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
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(19)),
          actions: [
            const SizedBox(
              height: 40,
            ),
            TextField(
              onTapOutside: (context) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: const InputDecoration(
                hintText: "todo name",
              ),
              controller: title,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Text("Recurrence"),
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
                  initialSelection: Timer.daily,
                  onSelected: (value) => {timely = (value ?? timely)},
                ),
              ],
            ),
            Row(
              children: [
                const Text("Category"),
                const Spacer(),
                DropdownMenu(
                  width: MediaQuery.sizeOf(context).width / 2,
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: cats.chore, label: "Chore"),
                    DropdownMenuEntry(
                        value: cats.bucketList, label: "Bucket list"),
                  ],
                  initialSelection: cats.chore,
                  onSelected: (value) => {cat = (value ?? cat)},
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    if (title.text.isEmpty) {
                      var overlayEntry = OverlayEntry(
                        builder: (BuildContext context) {
                          return Container(
                            alignment: Alignment.bottomCenter,
                            child: Dismissible(
                              key: const Key("xyz"),
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                alignment: Alignment.center,
                                height: 70,
                                child: const Text(
                                  "todo title is null",
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                      Overlay.of(context).insert(overlayEntry);
                      Future.delayed(const Duration(seconds: 3), () {
                        overlayEntry.remove();
                      });
                    } else {
                      widget.addtodo(
                        todo(title.text, timely, cat, done: false),
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    "Save",
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
