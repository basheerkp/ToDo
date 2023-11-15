part of 'home_page.dart';

class NotCompleted extends StatefulWidget {
  const NotCompleted({super.key});

  @override
  State<NotCompleted> createState() => _NotCompletedState();
}

class _NotCompletedState extends State<NotCompleted> {
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

  void tododone(int index) {
    print(done_list.last);
    setState(() {
      done_list.add(todo_list[index]);
      todo_list.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(22))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  "Done",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Container(
                width: 100,
                height: 40,
                alignment: Alignment.center,
                child: const Text(
                  "To-Do",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: 150,
                child: ElevatedButton.icon(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  onPressed: () {
                    setState(() {
                      asc = asc ? false : true;
                    });
                  },
                  icon: asc
                      ? const Icon(
                          Icons.arrow_upward_outlined,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.arrow_downward_outlined,
                          color: Colors.white,
                        ),
                  label: asc
                      ? const Text(
                          "Ascending",
                          style: TextStyle(color: Colors.white),
                        )
                      : const Text(
                          "Descending",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ],
          ),
        ),
        sortedTodos.isEmpty
            ? const Text("no tasks found")
            : DoList(
                sort: asc,
                doList: sortedTodos,
                donefunction: tododone,
              ),
      ],
    );
  }
}
