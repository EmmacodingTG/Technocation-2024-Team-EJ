import 'package:flutter/material.dart';
import 'package:litter_app/pages.dart/before_picture_page.dart';

import 'package:clipboard/clipboard.dart';

class LocationDetailsPage extends StatelessWidget {
  final  place;

  const LocationDetailsPage({Key? key, required this.place}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(146, 21, 125, 49),
          title: Text('Details'),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(children: <Widget>[
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text('Location:',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      )),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    place.park,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      FlutterClipboard.copy(place.park);
                    },
                    child: const Icon(Icons.copy),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Littery severity:',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    place.litterseverity,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                              height: 250,
                              width: 400,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
                                      label: const Text('Edit'),
                                      icon: const Icon(Icons.edit),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    label: const Text('Delete'),
                                    icon: const Icon(Icons.delete),
                                  ),
                               
                                   
                 
            ],
                              ));
                        });
                },
                  label: const Text('Show Options'),
                  icon: const Icon(Icons.more),
                ),
              ),
            ])),
      );

}