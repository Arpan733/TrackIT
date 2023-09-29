import 'package:flutter/material.dart';
import 'package:sih2/backend.dart';
import 'package:sih2/screens/buslist.dart';
import 'package:sih2/variables.dart';

class trackit extends StatefulWidget {
  const trackit({Key? key}) : super(key: key);

  @override
  State<trackit> createState() => _trackitState();
}

class _trackitState extends State<trackit> {
  final sourceController = TextEditingController();
  final destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Image.asset(
                  "assets/images/trackit.jpg",
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 18, right: 18),
                      child: TextField(
                        cursorColor: const Color(0xFF372490),
                        controller: sourceController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                              color: Color(0xFF7CD202),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                              color: Color(0xFF7CD202),
                              width: 1,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Source',
                          hintStyle: const TextStyle(
                            color: Color(0xFF372490),
                            fontSize: 16,
                          ),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF372490),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 18, right: 18),
                      child: TextField(
                        cursorColor: const Color(0xFF372490),
                        controller: destinationController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                              color: Color(0xFF7CD202),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                              color: Color(0xFF7CD202),
                              width: 1,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Destination',
                          hintStyle: const TextStyle(
                            color: Color(0xFF372490),
                            fontSize: 16,
                          ),
                        ),
                        style: const TextStyle(
                          color: Color(0xFF372490),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (sourceController.text.isNotEmpty &&
                            destinationController.text.isNotEmpty) {
                          variables.source = sourceController.text;
                          variables.destination = destinationController.text;
                          // print(variables.source);
                          // print(variables.destination);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const buslist(),
                            ),
                          );

                          variables.generatelistofbus();
                          print(variables.listofbus);

                          variables.generatebusbysandd();
                          print(variables.busbysandd);

                          sourceController.text = "";
                          destinationController.text = "";
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(317, 40),
                        backgroundColor: const Color(0xFF372490),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        "Track It",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7CD202),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
