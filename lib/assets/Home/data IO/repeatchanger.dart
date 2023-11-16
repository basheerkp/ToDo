import 'package:flutter/material.dart';
import 'package:todo/assets/Storage/temp/todo.dart';

class ChangeTimer extends StatelessWidget {
  ChangeTimer({super.key, required this.currentdo, this.temp});

  Timer? temp;

  final todo currentdo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: AlertDialog(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 16, 16, 16),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              side: BorderSide(color: Color.fromARGB(255, 247, 239, 229))),
          actions: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Recurrence : ",
                  style: TextStyle(fontSize: 20),
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
                  onSelected: (value) => {temp = (value ?? temp)},
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
                      temp == null
                          ? currentdo.timer = Timer.onetime
                          : currentdo.timer = temp!;
                      currentdo.category = [
                        Timer.yearly,
                        Timer.monthly,
                        Timer.weekly,
                        Timer.daily
                      ].contains(temp)
                          ? cats.chore
                          : cats.bucketList;
                      print(currentdo.timer);
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
