import 'package:litter_app/pages.dart/first_page.dart';

import 'package:flutter/material.dart';
var torontoorwaterloo = 'HI';
class SignUpMapPage extends StatefulWidget {
  const SignUpMapPage({super.key});

  @override
  State<SignUpMapPage> createState() => _SignupMapPageState();
}

class _SignupMapPageState extends State<SignUpMapPage> {
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
                        onPressed: (){torontoorwaterloo = 'BYE';},
                       
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
                       onPressed: (){torontoorwaterloo = 'HI';},
                        
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
