import 'dart:async';

import 'package:flutter/material.dart';
import 'package:litter_app/after_picture.dart';

import 'clean_page.dart';


String user_time = '';
String user_date ='';

String address = addressTextEditingController.text;
  final addressTextEditingController =
      TextEditingController();
     
class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  DateTime _dateTime = DateTime.now();
  DateTime? selectedDate;


  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime(2024, 3, 15),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          _dateTime = pickedDate;
         user_date = pickedDate.toString();
        });
      }
    });
  }

  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = '00', digitMinutes = '00', digitHours = '00';
  Timer? timer;
  bool started = false;

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  } // end void stop

  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = '00';
      digitMinutes = '00';
      digitHours = '00';

      started = false;
    }
    );
  } // end void reset

  void start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        } // end else
      } // end if

      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitSeconds = (seconds >= 10) ? '$seconds' : '0$seconds';
        digitMinutes = (minutes >= 10) ? '$minutes' : '0$minutes';
        digitHours = (hours >= 10) ? '$hours' : '0$hours';
      });
    });
  } // end void start

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(146, 21, 125, 49),
        title: const Text('Step 2: Time Your Cleaning'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 30),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Cleaning:',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                     decorationColor: Color.fromARGB(146, 21, 125, 49),
                        decorationThickness: 2,
       
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  'assets/images/data-cleaning.png',
                  width: 45,
                ),
              ),
            ],
          ),
        Row(
            children: [
             const SizedBox(width: 30),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text('Address: $user_location',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
            ],
          ),
         
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ElevatedButton.icon(
              onPressed: _showDatePicker,
              label: const Text('Choose Date'),
              icon: const Icon(Icons.calendar_month),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                SizedBox(width: 30),
                Text(
                  'Chosen Date:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 30),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  _dateTime.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),

       
         const  Padding(
            padding:  EdgeInsets.only(top:65),
            child:  Row(
              children: [
               SizedBox(width:30), Text('Stopwatch:',
       
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
              ],
            ),
          ),
        (Text('$digitHours:$digitMinutes:$digitSeconds',style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),)),
                  const SizedBox(height:30),
          ElevatedButton(
              onPressed: () {
                (!started) ? start() : stop();
              },
              child: Text(
                (!started) ? 'start' : 'pause',
              )),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: const Text(
                              'Are you sure you wish to reset the stopwatch?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  reset();
                                    Navigator.pop(context);

                                },
                                child: const Text('yes')),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('no'))
                          ],
                        ));
              },
              child: const Text('reset')),
          ElevatedButton(
              onPressed: () {
                user_time = '$digitHours hours and $digitMinutes minutes';
                print(address);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AfterPicturePage()));
              },
              child: const Text('next')
              )
        ],
      )
    );
  }
}
