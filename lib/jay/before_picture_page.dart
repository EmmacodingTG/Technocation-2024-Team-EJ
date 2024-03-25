import 'package:flutter/material.dart';
import 'package:litter_app/jay/stopwatch_page.dart';
import 'timer_page.dart';
import 'global_variable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';

class BeforePicturePage extends StatefulWidget {
  const BeforePicturePage({super.key});

  @override
  State<BeforePicturePage> createState() => _BeforePicturePageState();
}
class _BeforePicturePageState extends State<BeforePicturePage> {
  
  @override
void navigateToTimerPage(BuildContext context) {addressTextEditingController.clear(); Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TimerPage()),
  );
}

  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(146, 21, 125, 49),
        title: const Text('Step 3: Add Picture'),
      ),
      body: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'BEFORE PHOTO:',
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
          Row(
            children: [
            SizedBox(width: 75,),
             Text(contactemail),
             SizedBox(width: 15,),
              InkWell(
                onTap: () {
                  FlutterClipboard.copy(contactemail);
                },
                child: const Icon(Icons.copy),
              ),
            ],
          ),
          IconButton(
              icon: const Icon(Icons.photo_camera),
              iconSize: 100,
              onPressed: () async {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                if (image == null) return;
                await Share.shareFiles([image.path],
                    subject: 'Hello', text: 'THIS IS THE IMAGE!!');
              }),
     
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StopwatchPage())
              );
            },
            label: const Text('NEXT'),
            icon: const Icon(Icons.done),
          ),
    ]
        ,
      ),
    );
  }
}
