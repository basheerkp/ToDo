part of 'home_page.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  void tododone(int index) {
    setState(() {
      todo_list.add(done_list[index]);
      done_list.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(21))),
          height: 50,
          margin: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: const Row(
            children: [
              SizedBox(
                width: 50,
              ),
              Text(
                "Completed tasks",
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
            ],
          ),
        ),
        DoList(
          doList: done_list,
          shown: true,
          donefunction: tododone,
          sort: false,
        )
      ],
    );
  }
}
