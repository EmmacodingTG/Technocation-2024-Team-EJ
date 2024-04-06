import 'package:flutter/material.dart';
import 'package:litter_app/first_page.dart';

String torontoorwaterloo = '';

class LocationSelectPage extends StatefulWidget {
  const LocationSelectPage({super.key});

  @override
  State<LocationSelectPage> createState() => _LocationSelectState();
}

class _LocationSelectState extends State<LocationSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'CHOOSE A LOCATION',
              style: TextStyle(
                  color: Color.fromARGB(221, 5, 5, 5),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/map.png',
              width: 250,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color.fromARGB(115, 17, 223, 99),
                                Color.fromARGB(115, 17, 223, 99)
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          torontoorwaterloo = 'Toronto, ON';
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FirstPage())
                          );
                          },
                       
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(top: 5),
                          foregroundColor: const Color.fromARGB(221, 0, 0, 0),
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        child: const Text('Toronto!'),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/cn-tower.png',
                  width: 50,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color.fromARGB(115, 17, 223, 99),
                                Color.fromARGB(115, 17, 223, 99)
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                       onPressed: (){
                         torontoorwaterloo = 'Waterloo, ON';
                         Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => FirstPage())
                         );
                         },
                        
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(top: 5),
                          foregroundColor: const Color.fromARGB(221, 0, 0, 0),
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        child: const Text('Waterloo!'),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/waterloo.png',
                  width: 50,
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
