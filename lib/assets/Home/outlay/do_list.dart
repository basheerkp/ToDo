import 'package:flutter/material.dart';
import 'package:todo/assets/Home/outlay/do_item.dart';
import 'package:todo/assets/Storage/temp/todo.dart';

class DoList extends StatelessWidget {
  const DoList(
      {super.key,
      required this.sort,
      required this.doList,
      required this.donefunction,
      this.shown = false});

  final void Function(int index) donefunction;
  final List doList;
  final bool sort;
  final bool shown;

  IconData getIcon(todo example) {
    IconData toDoIcon = Icons.alarm;
    if (example.category == cats.bucketList) {
      toDoIcon = Icons.one_x_mobiledata;
    }
    return toDoIcon;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 250,
      child: ListView.builder(
        itemCount: doList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: DoItem(
            donefunction: donefunction,
            number: index + 1,
            doIcon: getIcon(doList[index]),
            current: doList[index],
          ));
        },
      ),
    );
  }
}
