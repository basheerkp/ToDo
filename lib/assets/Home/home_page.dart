import 'package:flutter/material.dart';
import 'package:todo/assets/Home/data%20IO/newDO.dart';
import 'package:todo/assets/Home/outlay/do_list.dart';
import 'package:todo/assets/Storage/temp/datas.dart';

import '../Storage/temp/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateHomePage();
  }
}

class _StateHomePage extends State<HomePage> {
  bool asc = true;
  bool showDone = false;

  List get sortedTodos {
    List sortedTodo = List.of(todo_list);
    sortedTodo.sort((a, b) {
      final bComesAfterA = a.title.compareTo(b.title);
      return asc ? bComesAfterA : -bComesAfterA;
    });
    return sortedTodo;
  }

  void addtodo(todo newobj) {
    setState(() {
      todo_list.add(newobj);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do"),
      ),
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 40,
              alignment: Alignment.center,
              child: const Text(
                "Done",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              width: 100,
              height: 40,
              alignment: Alignment.center,
              child: const Text(
                "To-Do",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(right: 20),
              width: 150,
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        asc = asc ? false : true;
                      });
                    },
                    icon: asc
                        ? const Icon(Icons.arrow_upward_outlined)
                        : const Icon(Icons.arrow_downward_outlined),
                    label: asc
                        ? const Text("Ascending")
                        : const Text("Descending"),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(child: DoList(sort: asc, doList: sortedTodos)),
        Container(
          height: 50,
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              const Text("Completed tasks"),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          showDone = showDone ? false : true;
                        });
                      },
                      icon: !showDone
                          ? const Icon(Icons.arrow_upward_outlined)
                          : const Icon(Icons.arrow_downward_outlined),
                      label: showDone ? const Text("show") : const Text("hide"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Flexible(child: DoList(sort: asc, doList: sortedTodos, done: showDone)),
      ]),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return NewDo(addtodo: addtodo);
              });
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
