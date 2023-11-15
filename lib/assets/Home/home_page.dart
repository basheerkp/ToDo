import 'package:flutter/material.dart';

import '../Storage/temp/datas.dart';
import '../Storage/temp/todo.dart';
import 'data IO/newDO.dart';
import 'outlay/do_list.dart';

part 'completed.dart';
part 'non_completed.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateHomePage();
  }
}

class _StateHomePage extends State<HomePage> {
  bool done = false;

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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(7)),
                  height: 60,
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        done = false;
                      });
                    },
                    child: const Text("on-going"),
                  )),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(7)),
                  height: 60,
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        done = true;
                      });
                    },
                    child: const Text("completed"),
                  )),
            ],
          ),
          done ? const Completed() : const NotCompleted()
        ],
      ),
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
