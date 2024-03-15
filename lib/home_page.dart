import 'package:flutter/material.dart';
import 'package:litter_app/before_picture_page.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

final colorcontroller = TextEditingController();
final MapController mapController = MapController();
@override
void dispose(){
  locationContoller.dispose();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final myController = TextEditingController();
double _currentValue = 15;
var colorbox;

class _HomePageState extends State<HomePage> {
  List<String> items = ['Toronto', 'Waterloo'];
  String? selectedItem = 'Toronto';
  TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            height: 128,
            decoration:
                const BoxDecoration(color: Color.fromARGB(146, 21, 125, 49)),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    DropdownButton<String>(
                        value: selectedItem,
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item,
                                      style: const TextStyle(fontSize: 24)),
                                ))
                            .toList(),
                        onChanged: (item) =>
                            setState(() => selectedItem = item)),
                    const SizedBox(
                      width: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text('Search Location'),
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
              ],
            ),
          ),
            TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Latitude'),
                                 ),
                                   TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Longitude'),
                                 ),
          Flexible(
            flex: 500,
            child: FlutterMap(
              options:
                  const MapOptions(center: LatLng(43.6426, -79.3871), zoom: 15),
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
                          LatLng(36.95, -9.5),
                          LatLng(42.25, -9.5),
                          LatLng(42.25, -6.2),
                          LatLng(36.95, -6.2),
                        ],
                        color: Colors.blue.withOpacity(0.5),
                        borderStrokeWidth: 2,
                        borderColor: Colors.blue,
                        isFilled: true),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton.icon(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                          height: 400,
                          child: Column(
                            children: [
                               TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Latitude'),
                                 ),
                                   TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Longitude'),
                                 ),
                              TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Litter density'),
                                      controller: colorcontroller,
                                  ),
                              ElevatedButton(
                                child: const Text('Done'),
                                onPressed: () {
                                  if ((colorcontroller.text) == '1') {
                                    Navigator.pop(context);
                                    MarkerLayer(
                                      markers: [
                                        Marker(
                                          point: LatLng(43.6426, -79.38710),
                                          width: 80,
                                          height: 80,
                                          child: Image.asset(
                                            'assets/images/square.png',
                                            width: 250,
                                          ),
                                        ),
                                      ],
                                    );
                                    if ((colorcontroller.text) == '2') {
                                      MarkerLayer(
                                        markers: [
                                          Marker(
                                            point: LatLng(43.6426, -79.3871),
                                            width: 80,
                                            height: 80,
                                            child: Image.asset(
                                              'assets/images/square (1).png',
                                              width: 250,
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                    if ((colorcontroller.text) == '3') {
                                      MarkerLayer(
                                        markers: [
                                          Marker(
                                            point: LatLng(43.6426, -79.3871),
                                            width: 80,
                                            height: 80,
                                            child: Image.asset(
                                              'assets/images/square (2).png',
                                              width: 250,
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                    if ((colorcontroller.text) == '4') {
                                      MarkerLayer(
                                        markers: [
                                          Marker(
                                            point: LatLng(43.6426, -79.3871),
                                            width: 80,
                                            height: 80,
                                            child: Image.asset(
                                              'assets/images/square (3).png',
                                              width: 250,
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                    if ((colorcontroller.text) == '5') {
                                      MarkerLayer(
                                        markers: [
                                          Marker(
                                            point: LatLng(43.6426, -79.3871),
                                            width: 80,
                                            height: 80,
                                            child: Image.asset(
                                              'assets/images/square (4).png',
                                              width: 250,
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  }
                                  ;
                                },
                              ),
                            ],
                          ));
                    });
              },
              label: const Text('ADD SQUARE'),
              icon: const Icon(Icons.add),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 60),
                              Image.asset(
                                'assets/images/alert.png',
                                width: 20,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'DISCLAIMER',
                                style: TextStyle(
                                  color: Color.fromARGB(221, 255, 255, 255),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Image.asset(
                                'assets/images/alert.png',
                                width: 20,
                              ),
                            ],
                          ),
                          const Text(
                            'Our app is not responsible for any incidents or injuries that may occur during clean ups. Please wear protective equipment before cleaning.',
                            style: TextStyle(
                              color: Color.fromARGB(221, 255, 255, 255),
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          ),
                          const SizedBox(
                            width: 90,
                          ),
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BeforePicturePage(),
                              ),
                            ),
                            child: const Text('Continue'),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            label: const Text('Clean'),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
