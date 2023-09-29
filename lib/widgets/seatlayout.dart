import 'package:flutter/material.dart';
import 'package:sih2/variables.dart';

class seatlayout extends StatefulWidget {
  const seatlayout({Key? key}) : super(key: key);

  @override
  State<seatlayout> createState() => _seatlayoutState();
}

class _seatlayoutState extends State<seatlayout> {
  @override
  Widget build(BuildContext context) {
    int rows = 8;
    int items = 5;
    List<int> seatnumber = List<int>.filled(40, 0);

    int i = 0;
    List<String> ids = [];
    int seat = 0;

    for (var element in variables.listofbus!) {
      ids.add(element["busId"]);
    }

    i = ids.indexOf(variables.id!);

    List<dynamic> seatn = variables.listofbus![i]["seatNumber"];
    print(seatn);

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            rows,
            (r) {
              return Row(
                children: List.generate(
                  items,
                  (c) {
                    if (c == 0 && r == 0) {
                      seat = 0;
                    } else if (c != 2) {
                      seat++;
                    }
                    return Container(
                      child: c != 2
                          ? IconButton(
                              onPressed: () {},
                              icon: seatn[seat] == false
                                  ? const Icon(
                                      Icons.event_seat_outlined,
                                      size: 50,
                                    )
                                  : const Icon(
                                      Icons.event_seat_rounded,
                                      size: 50,
                                    ),
                            )
                          : Container(
                              width: 85,
                            ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
