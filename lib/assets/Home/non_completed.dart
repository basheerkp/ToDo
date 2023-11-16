part of 'home_page.dart';

class NotCompleted extends StatefulWidget {
  const NotCompleted({super.key});

  @override
  State<NotCompleted> createState() => _NotCompletedState();
}

class _NotCompletedState extends State<NotCompleted> {
  bool asc = true;
  bool showDone = false;

  void addtodo(todo newobj) {
    setState(() {
      todo_list.add(newobj);
    });
  }

  void tododone(int index) {
    setState(() {
      done_list.insert(0, todo_list[index]);
      todo_list.removeAt(index);
    });
  }

  List get sortedTodos {
    todo_list.sort((a, b) {
      final bComesAfterA = a.title.compareTo(b.title);
      return asc ? bComesAfterA : -bComesAfterA;
    });
    return todo_list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(right: 40, top: 10, bottom: 20),
              width: 150,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    shadowColor: asc
                        ? const MaterialStatePropertyAll(Colors.blue)
                        : const MaterialStatePropertyAll(Colors.red),
                    elevation: const MaterialStatePropertyAll(4),
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 16, 16, 16))),
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
        sortedTodos.isEmpty
            ? Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height - 295,
                child: Text(
                  "NO TASKS",
                  style: GoogleFonts.inter(fontSize: 50, color: Colors.white),
                ))
            : SizedBox(
                height: MediaQuery.of(context).size.height - 295,
                child: DoList(
                  sort: asc,
                  doList: sortedTodos,
                  donefunction: tododone,
                ),
              ),
        Container(
          margin: const EdgeInsets.only(right: 15, bottom: 15),
          width: 80,
          height: 50,
          child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 247, 239, 229))),
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return NewDo(addtodo: addtodo);
                  });
            },
            child: const Icon(
              Icons.add_rounded,
              color: Color.fromARGB(255, 16, 16, 16),
            ),
          ),
        ),
      ],
    );
  }
}
