import 'package:flutter/material.dart';
import 'package:litter_app/before_picture_page.dart';
class FindLocationPage extends StatefulWidget {
  const FindLocationPage({super.key});

  @override
  State<FindLocationPage> createState() => _FindLocationPageState();
}

class _FindLocationPageState extends State<FindLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
        backgroundColor: const Color.fromARGB(146, 21, 125, 49),
        title: const Text('Find A Park'),
      ),
      
             body: Column(
                children: [
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
