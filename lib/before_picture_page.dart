
import 'package:flutter/material.dart';

import 'package:litter_app/image_input.dart';
import 'package:litter_app/timer_page.dart';



class BeforePicturePage extends StatefulWidget {
  const BeforePicturePage({super.key});

  @override
  State<BeforePicturePage> createState() => _BeforePicturePageState();
}

class _BeforePicturePageState extends State<BeforePicturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(146, 21, 125, 49),
        title: const Text('Step 1: Add Picture'),
      ),
      body: Column(
        children: [
           
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'BEFORE PHOTO:'
              ,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                   decoration: TextDecoration.underline,
                     decorationColor: Color.fromARGB(146, 21, 125, 49),
                        decorationThickness: 2,
                ),
              ),
            ),
          ),
         const Padding(
            padding: EdgeInsets.only(top: 8),
          ),
         const  Text(
            'Click box to retake picture',
            style: TextStyle(
              color: Color.fromARGB(221, 255, 255, 255),
              fontSize: 15,
              fontStyle: FontStyle.italic,
              
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(25),
            child: ImageInput(),
          ),
          ElevatedButton.icon(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TimerPage(),
                    ),
                  ),
            label: const Text('NEXT'),
            icon: const Icon(Icons.done),
          ),
        ],
      ),
    );
  }
}
