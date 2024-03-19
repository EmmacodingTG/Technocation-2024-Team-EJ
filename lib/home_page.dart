import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'package:clipboard/clipboard.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:litter_app/findlocation_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController locationController = TextEditingController();
  final MapController mapController = MapController();
  final TextEditingController addsquarecontroller = TextEditingController();
  final TextEditingController addnumber = TextEditingController();

  @override
  void dispose() {
    locationController.dispose();
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            height: 144,
            decoration:
                const BoxDecoration(color: Color.fromARGB(146, 21, 125, 49)),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 15),
                  
           IconButton(
            icon: Icon(Icons.info),iconSize: 30, tooltip: 'Enter Provinces, Cities, Parks, or Postal Codes',
            onPressed: () {
              
            },
           ),
                    Expanded(
                      child: TextField(
                        controller: locationController,
                        decoration: InputDecoration(
                          hintText: 'Enter a location',
                       

                          
                          
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            
                            onPressed: () {
                              String location = locationController.text;
                              searchLocation(location);
                            },
                          ),
                        ),
                      ),
                    ),
                     InkWell(
                onTap: () {
                  FlutterClipboard.copy(locationController.text);
                },
                child: const Icon(Icons.copy),
              ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 500,
            child: FlutterMap(
              mapController: mapController,
              options: const MapOptions(
                  initialCenter: LatLng(43, -79), initialZoom: 10),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                PolygonLayer(
                  polygonCulling: false,
                  polygons: [
                    Polygon(
                      points: [
                        const LatLng(36.95, -9.5),
                        const LatLng(42.25, -9.5),
                        const LatLng(42.25, -6.2),
                        const LatLng(36.95, -6.2),
                      ],
                      color: Colors.blue.withOpacity(0.5),
                      borderStrokeWidth: 2,
                      borderColor: Colors.blue,
                      isFilled: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
         
            
          
          Column(
            children: [ElevatedButton.icon(
              onPressed: ()  => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FindLocationPage(),
                  ),
                ),
              label: const Text('Find a Park'),
              icon: const Icon(Icons.location_on),
            ),
             
            ],
          ),
        ],
      ),
    );
  }

  void searchLocation(String input) async {
    try {
      List<Location> locations = await locationFromAddress(input);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        setState(
          () {
            mapController.move(
                LatLng(location.latitude, location.longitude), 18.0);
          },
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Location not found'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error searching for location: $e'),
        ),
      );
    }
  }
}
