part of 'home_page.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  void undone(int index) {
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
        const SizedBox(
          height: 78,
        ),
        done_list.isEmpty
            ? Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height - 295,
                child: Text(
                  "NO COMPLETED TASKS ",
                  style: GoogleFonts.inter(fontSize: 40, color: Colors.white),
                ))
            : DoList(
                doList: done_list,
                shown: true,
                donefunction: undone,
                sort: false,
              )
      ],
    );
  }
}
