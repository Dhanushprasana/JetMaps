import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class AssistPage2 extends StatefulWidget {
  const AssistPage2({Key? key});

  @override
  State<AssistPage2> createState() => _UserPageState2();
}

class _UserPageState2 extends State<AssistPage2> {
  final end = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  bool isVisible = false;
  LatLng? currentLocation;
  var clatitude;
  var clongitude;

  @override
  void initState() {
    super.initState();
    _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Set the current latitude and longitude values
      clatitude = position.latitude;
      clongitude = position.longitude;

      // Update the currentLocation variable
      currentLocation = LatLng(position.latitude, position.longitude);

      setState(() {
        isVisible = true;
      });
    } catch (e) {
      print("Error fetching current location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Assist',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.grey[300],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  if (isVisible)
                    FlutterMap(
                      options: MapOptions(
                        center: currentLocation ?? LatLng(0.0, 0.0),
                        zoom: 15,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.jet_maps2',
                        ),
                        MarkerLayer(
                          markers: [
                            if (currentLocation != null)
                              Marker(
                                width: 80.0,
                                height: 80.0,
                                point: currentLocation!,
                                builder: (ctx) => Container(
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 150, // Adjust the height according to your needs
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20), // Adjust padding to increase the size of the box

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.black, style: BorderStyle.solid, width: 2),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    // Handle camera icon press
                                  },
                                  icon: Icon(Icons.camera_alt),
                                  color: Colors.blue,
                                  iconSize: 30,
                                ),
                              ),

                              SizedBox(width: 20),
                              Text(
                                'Take Picture',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle take picture button press
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(20.0)),
                            minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50.0)), // Set minimum size to fit the width
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white

                          ),

                          child: Text('Issue Resolved',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
