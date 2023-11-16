import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  Color LineColor = const Color.fromARGB(255, 59, 86, 31);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(child: Text("")),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(7)),
                  height: 60,
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextButton(
                    style: const ButtonStyle(
                      animationDuration: Duration.zero,
                    ),
                    onPressed: () {
                      setState(() {
                        done = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          "ON - GOING",
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 25,
                            color: Colors.white,
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 3,
                          width: 170,
                          decoration: BoxDecoration(
                              color: done ? Colors.white : LineColor),
                        )
                      ],
                    ),
                  )),
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(7)),
                  height: 60,
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextButton(
                    style: const ButtonStyle(
                      animationDuration: Duration.zero,
                    ),
                    onPressed: () {
                      setState(() {
                        done = true;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          "COMPLETED",
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 25,
                            color: Colors.white,
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 3,
                          width: 170,
                          decoration: BoxDecoration(
                              color: done ? LineColor : Colors.white),
                        )
                      ],
                    ),
                  )),
            ],
          ),
          done ? const Completed() : const NotCompleted()
        ],
      ),
    );
  }
}
