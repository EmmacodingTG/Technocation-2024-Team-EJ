import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litter_app/after_picture.dart';

String user_time = '';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {

  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = '00', digitMinutes = '00', digitHours = '00';
  Timer? timer;
  bool started = false;

  void stop(){
    timer!.cancel();
    setState(() {
      started = false;
    });
  } // end void stop

  void reset(){
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = '00';
      digitMinutes = '00';
      digitHours = '00';

      started = false;

    });
  } // end void reset

  void start(){
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59){
        if (localMinutes > 59){
          localHours ++;
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
        digitSeconds = (seconds >= 10) ?'$seconds':'0$seconds';
        digitMinutes = (minutes >= 10) ?'$minutes':'0$minutes';
        digitHours = (hours >= 10) ?'$hours':'0$hours';
      });

    });
  } // end void start

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cleaning'),
      ),
      body: Column(
        children: [
          Container(
            child: Text('location'),
          ),
          Container(
              child: Text('Stopwatch:')
          ),
          Container(
              child: Text('$digitHours:$digitMinutes:$digitSeconds')
          ),
          ElevatedButton(
              onPressed: () {
                (!started) ?start() : stop();
              },
              child: Text(
                (!started) ? 'start' : 'pause',
              )
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text('Are you sure you wish to reset the stopwatch?'),
                      actions: [
                        TextButton(onPressed: () {
                          reset();
                        }, child: Text('yes')
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('no')
                        )
                      ],
                    )
                );
              },
              child: Text('reset')
          ),
          ElevatedButton(
              onPressed: () {
                user_time = '$digitHours hours and $digitMinutes minutes';
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AfterPicturePage())
                );
              },
              child: Text('next')
          )
        ],
      ),
    );
  }
}
