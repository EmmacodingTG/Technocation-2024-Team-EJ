/* import 'package:flutter/material.dart';
import 'package:litter_app/pages.dart/first_page.dart';
import 'package:litter_app/pages.dart/home_page.dart';
import 'package:litter_app/pages.dart/records_page.dart';
import 'package:litter_app/pages.dart/send.dart';

class HandReportPage extends StatefulWidget {
  const HandReportPage({super.key});

  @override
  State<HandReportPage> createState() => _HandReportPageState();
}

class _HandReportPageState extends State<HandReportPage> {
  double _currentValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(146, 21, 125, 49),
        title: const Text(
          'Last Step: Update & Hand in Report',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: Column( children: [
        Row(
          children: [
            const SizedBox(width: 80),
            Padding(
              padding: const EdgeInsets.only(top:30),
              child: const Text('Update condition Severity',
               style: TextStyle(
                   
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  
              ),),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(_currentValue.toString(),
          style: TextStyle(fontSize: 40),),
        ),

        Slider(
          value: _currentValue,
          min:1.0,
          max:5,
          divisions: 4,
          label: _currentValue.toString(),
          activeColor: const Color.fromARGB(255, 132, 202, 134),
          inactiveColor: Color.fromARGB(99, 184, 243, 186),
          onChanged: (value) {
            setState((){
              _currentValue = value;
            });
          },
        ),
           Padding(
             padding: const EdgeInsets.only(top: 30),
             child: Row(
              
               children: [
                const SizedBox(
                  width: 30,
                ),
                 Image.asset(
              'assets/images/smile.png',
              width: 25,
                       ),
                       const SizedBox(
                  width: 10,
                ),
                 Text('Good'),
                 const SizedBox(
                  width: 85,
                ),
                  Image.asset(
              'assets/images/right-arrow.png',
              width: 25,
                       ),
                       const SizedBox(
                  width: 85
                ),
                 Text('Bad'),
                 const SizedBox(
                  width: 10,
                ),
                  Image.asset(
              'assets/images/sad.png',
              width: 25,
                       ),
               ],
             ),
           ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 250),
            child: ElevatedButton.icon(
            
                      onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SendPage(),
                  ),
                ),

                label: const Text('NEXT'),
                icon: const Icon(Icons.done),
              ),
                  ),
                ),
                ]));
              }
        }
 */