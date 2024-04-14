import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'myinput.dart';
import 'user2.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final end = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  bool isVisible = false;
  LatLng? currentLocation;
  LatLng? deslocation;

  var clatitude;
  var clongitude;
  List<LatLng> routpoints = [LatLng(52.05884, -1.345583)];

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

  LatLng _handleSubmit() {
    double latitude1 = double.tryParse(latitudeController.text) ?? 0.0;
    double longitude2 = double.tryParse(longitudeController.text) ?? 0.0;
    var savedLatitude = latitude1;
    var savedLongitude = longitude2;
    var deslocation = LatLng(savedLatitude, savedLongitude);
    return deslocation;
  }

  Future<void> fetchRoute() async {
    try {
      // Get the destination location
      LatLng destinationLocation = _handleSubmit();
      double destinationLatitude =13.053740938216592;
      double destinationLongitude =80.21334923862112;
      deslocation = LatLng(destinationLatitude, destinationLongitude);

      // Clear the routpoints list before adding new points
      routpoints=[];

      // Build the URL with destination latitude and longitude
      var url = Uri.parse(
          'http://router.project-osrm.org/route/v1/driving/$clongitude,$clatitude;$destinationLongitude,$destinationLatitude?steps=true&annotations=true&geometries=geojson&overview=full');

      // Make the HTTP GET request
      var response = await http.get(url);
      print(response.body);

      // Process the response
      setState(() {
        var ruter =
        jsonDecode(response.body)['routes'][0]['geometry']['coordinates'];
        for (int i = 0; i < ruter.length; i++) {
          var reep = ruter[i].toString();
          reep = reep.replaceAll("[", "");
          reep = reep.replaceAll("]", "");
          var lat1 = reep.split(',');
          var long1 = reep.split(",");
          routpoints.add(LatLng(double.parse(lat1[1]), double.parse(long1[0])));
        }
      });
    } catch (e) {
      print('Error fetching route: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User',
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
                            if (deslocation != null)
                              Marker(
                                width: 80.0,
                                height: 80.0,
                                point: deslocation!,
                                builder: (ctx) => Container(
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        PolylineLayer(
                          polylines: [
                            Polyline(
                              points: routpoints,
                              color: Colors.black,
                              strokeWidth: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  Positioned(
                    top: 16.0,
                    right: 16.0,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to another page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserPage2()),
                        );
                      },
                      child: Image.asset(
                        'assets/dangericon2.png', // Full file path to your icon image
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,

                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15), // Optional: adds rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),


                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Set main axis size to min

                        children: [
                          myInput(
                            controler: end,
                            hint: 'Enter Ending PostCode',
                          ),

                          Container(
                            alignment: Alignment.bottomCenter, // Align the button to the bottom center
                            width: 800.0, // Set the width to match the parent width
                            height: 100.0, // Set the height to your desired value
                            padding: EdgeInsets.symmetric(horizontal: 55.0), // Add padding if needed
                            child: ElevatedButton(
                              onPressed: () async {
                                await fetchRoute();

                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero), // Remove padding
                                minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50.0)), // Set minimum size to fit the width
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white

                              ),


                              child: Text(
                                'Find Route',
                                style: TextStyle(fontSize: 20.0), // Set button text size
                              ),
                            ),
                          ),

                        ],
                      ),
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
