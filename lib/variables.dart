import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:sih2/backend.dart';
import 'package:sih2/models/busdetails.dart';

class variables {
  static String? source;
  static String? destination;
  static String? id;
  static DateTime? date = DateTime.now();
  static String? day = DateFormat('dd MMM,yyyy').format(date!);
  static List<dynamic>? listofbus = [];
  static List<int> busbysandd = [];

  static String? getsource() {
    return source;
  }

  static String? getdestination() {
    return destination;
  }

  static String? getdate() {
    day = DateFormat('dd MMM,yyyy').format(date!);
    return day;
  }

  static String? gettodaydate() {
    date = DateTime.now();
    day = DateFormat('dd MMM,yyyy').format(date!);
    return day;
  }

  static String? getnextday() {
    date = date?.add(const Duration(days: 1));
    day = DateFormat('dd MMM,yyyy').format(date!);
    return day;
  }

  static List<BusModel>? generatelistofbus() {
    if (backend.jsonResponse?["success"] == true &&
        backend.jsonResponse?["bus"] != null) {
      var jsonResponse = backend.jsonResponse;
      listofbus = jsonResponse?.values.elementAt(1);
    } else {
      print('Failed to load data');
    }
    return null;
  }

  static void generatebusbysandd() {
    // for (int i = 0; i < (listofbus!.length ?? 0); i++) {
    //   var element = listofbus![i];
    //
    //   if (source?.toLowerCase() == element.from.toLowerCase()) {
    //     busbysandd?.add(i);
    //     print(busbysandd);
    //   }
    // }
    busbysandd = [];
    var i = 0;

    listofbus?.forEach((element) {
      if (source?.trim().toLowerCase() ==
          element["from"].trim().toString().toLowerCase()) {
        busbysandd.add(i);
      }

      i++;
    });
  }
}
