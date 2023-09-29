import 'package:flutter/material.dart';
import 'package:sih2/dummy.dart';
import 'package:sih2/screens/livelocation.dart';
import 'package:sih2/variables.dart';

class buslist extends StatefulWidget {
  const buslist({Key? key}) : super(key: key);

  @override
  State<buslist> createState() => _buslistState();
}

class _buslistState extends State<buslist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            "${variables.source} - ${variables.destination}",
            style: const TextStyle(
              fontSize: 23,
              color: Color(0xFF7CD202),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${variables.day}",
                  style: const TextStyle(
                    fontSize: 26,
                    color: Color(0xFF372490),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      variables.getnextday();
                    });
                  },
                  child: const Text(
                    "Next Day",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.only(top: 10, bottom: 5),
            color: Colors.black87,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: variables.listofbus!.length,
              itemBuilder: (BuildContext context, index) {
                if (variables.busbysandd.contains(index)) {
                  print(index);
                  return GestureDetector(
                    onTap: () {
                      variables.id =
                          variables.listofbus![index]["busId"] as String;
                      print(variables.listofbus![index]["busId"] as String);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => livelocation(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black87,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    // variables.listofbus![index].name,
                                    "GSRTC",
                                    style: const TextStyle(
                                      fontSize: 23,
                                      color: Color(0xFF7CD202),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    variables.listofbus![index]["busType"],
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                // "\$${variables.listofbus![index].ticketprice}",
                                "₹350",
                                style: const TextStyle(
                                  fontSize: 23,
                                  color: Color(0xFF372490),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                variables.listofbus![index]["departureTime"]
                                    .toString()
                                    .replaceAll(".", ":"),
                                // "10:00 AM",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${variables.listofbus![index]["duration"]["hours"]}:${variables.listofbus![index]["duration"]["minutes"]}",
                                    // "00:03",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                              BorderRadius.circular(2.5),
                                        ),
                                      ),
                                      Container(
                                        width: 220,
                                        height: 2,
                                        color: Colors.black54,
                                      ),
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                              BorderRadius.circular(2.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    variables.listofbus![index]["stops"]
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                variables.listofbus![index]["arrivalTime"]
                                    .toString()
                                    .replaceAll(".", ":"),
                                // "01:00 PM",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Container(
                              alignment: Alignment.center,
                              width: 88,
                              height: 21,
                              decoration: BoxDecoration(
                                color: const Color(0xFF7CD202),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(
                                variables.listofbus![index]["AvailableSeat"]
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF372490),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
