import 'package:flutter/material.dart';
import 'package:todo/assets/Home/outlay/do_item.dart';
import 'package:todo/assets/Storage/temp/todo.dart';

class DoList extends StatelessWidget {
  const DoList(
      {super.key, required this.sort, required this.doList, this.done = false});

  final List doList;
  final bool sort;
  final bool done;

  Icon getIcon(todo example) {
    Icon toDoIcon = const Icon(Icons.alarm);
    if (example.category == cats.bucketList) {
      toDoIcon = const Icon(Icons.one_x_mobiledata);
    }
    return toDoIcon;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: done ? 1 : doList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: DoItem(
                doIcon: getIcon(doList[index]),
                current: doList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
