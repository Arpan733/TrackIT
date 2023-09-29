import 'package:flutter/material.dart';
import 'package:sih2/variables.dart';
import 'package:sih2/widgets/seatlayout.dart';

class seats extends StatefulWidget {
  const seats({Key? key}) : super(key: key);

  @override
  State<seats> createState() => _seatsState();
}

class _seatsState extends State<seats> {
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
      body: Container(
        child: Column(
          children: [
            const Row(
              children: [
                SizedBox(
                  width: 26,
                ),
                Text(
                  "GJ05MD4933",
                  style: TextStyle(
                    fontSize: 26,
                    color: Color(0xFF372490),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              margin: const EdgeInsets.only(top: 10),
              color: Colors.black87,
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 45, top: 20),
              child: Image.asset(
                "assets/images/steering.png",
                height: 42,
                width: 42,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            seatlayout(),
          ],
        ),
      ),
    );
  }
}
