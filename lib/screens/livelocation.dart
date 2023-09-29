import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih2/backend.dart';
import 'package:sih2/screens/seats.dart';
import 'package:sih2/variables.dart';

class livelocation extends StatefulWidget {
  const livelocation({Key? key}) : super(key: key);

  @override
  State<livelocation> createState() => _livelocationState();
}

class _livelocationState extends State<livelocation> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng location = const LatLng(21.1702, 72.8311);
  late Timer _timer;
  List<String> ids = [];
  double zoom = 10;
  int i = 0;

  void updatelocation(i) {
    location = LatLng(
      double.parse(variables.listofbus![i]["latitude"].toString()),
      double.parse(variables.listofbus![i]["longitude"].toString()),
    );
  }

  void _updateCamera() {
    setState(() {
      location = LatLng(location.latitude, location.longitude);
      zoom = 15.0;
    });

    _controller.future.then((mapController) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: location,
          zoom: zoom,
        ),
      ));
    });
  }

  @override
  void initState() {
    super.initState();

    for (var element in variables.listofbus!) {
      ids.add(element["busId"]);
    }

    i = ids.indexOf(variables.id!);

    _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
      setState(() {
        _updateCamera();
        backend.fetchData();
        variables.generatelistofbus();
        updatelocation(i);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(variables.listofbus?[i]["latitude"]);
    backend.fetchData();
    variables.generatelistofbus();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: Container(
                child: GoogleMap(
                  mapType: MapType.satellite,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                    Factory<OneSequenceGestureRecognizer>(
                      () => EagerGestureRecognizer(),
                    ),
                  },
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: location,
                    zoom: zoom,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId("source"),
                      position: location,
                    ),
                  },
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.2,
              maxChildSize: 0.325,
              minChildSize: 0.2,
              builder: (context, ScrollController scrollcontroller) {
                return SingleChildScrollView(
                  controller: scrollcontroller,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.325,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 6,
                            width: 50,
                            margin: const EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                              color: const Color(0xFF372490),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Text(
                          "GJ05MD4933",
                          style: const TextStyle(
                            fontSize: 33,
                            color: Color(0xFF372490),
                          ),
                        ),
                        Text(
                          "${variables.source.toString().toLowerCase()} - ${variables.destination.toString().toLowerCase()}",
                          style: const TextStyle(
                            fontSize: 19,
                            color: Color(0xFF7CD202),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Expected Arrival : ",
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.black45,
                              ),
                            ),
                            Text(
                              "8:00 PM",
                              style: TextStyle(
                                fontSize: 19,
                                color: Color(0xFF7CD202),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Emission Compilance : ",
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.black45,
                              ),
                            ),
                            Text(
                              "CNG",
                              style: TextStyle(
                                fontSize: 19,
                                color: Color(0xFF7CD202),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const seats()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(317, 40),
                              backgroundColor: const Color(0xFF372490),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: const Text(
                              "Check Seat Availability",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF7CD202),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
