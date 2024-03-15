import 'package:flutter/material.dart';

class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                height: 118,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(146, 21, 125, 49)),
                child: const Row(
                  children: [
                    Icon(
                      Icons.history,
                      size: 50,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Records',
                      style: TextStyle(
                        color: Color.fromARGB(221, 5, 5, 5),
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
