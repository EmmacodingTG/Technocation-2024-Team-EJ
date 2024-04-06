import 'package:flutter/material.dart';
import 'package:litter_app/clean_page.dart';
import 'package:litter_app/send.dart';
import 'package:litter_app/stopwatch_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';


bool before_image_taken = false;

class BeforePicturePage extends StatefulWidget {
  const BeforePicturePage({super.key});

  @override
  State<BeforePicturePage> createState() => _BeforePicturePageState();
}
class _BeforePicturePageState extends State<BeforePicturePage> {

  DateTime? selectedDate;
  final TextEditingController addressTextEditingController = TextEditingController();

  @override
void navigateToTimerPage(BuildContext context) {addressTextEditingController.clear(); Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>const StopwatchPage()),
  );
}
 String imageUrl ='';
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
             const  SizedBox(width: 75),
              Text(contact_email),
              const SizedBox(width: 15),
              InkWell(
                onTap: () async {
                  FlutterClipboard.copy(contact_email);
                },
                child: const Icon(Icons.copy),
              ),
            ],
          ),
         IconButton(
              icon: const Icon(Icons.photo_camera),
              iconSize: 100,
              onPressed: () async {
                final file =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                if (file == null) return;
                await Share.shareFiles([file.path],
                    subject: 'Hello', text: 'THIS IS THE IMAGE!!');
                before_image_taken = true;
                print('${file.path}');
                user_before_image = '${file.path}';
                String uniqueFileName =
                    DateTime.now().millisecondsSinceEpoch.toString();
                Reference referenceRoot = FirebaseStorage.instance.ref();
                Reference referenceDirImages = referenceRoot.child('images');
                Reference referenceImageToUpload =
                    referenceDirImages.child(uniqueFileName);
                try {
                  await referenceImageToUpload.putFile(File(file.path));
                 imageUrl= await referenceImageToUpload.getDownloadURL();
                } catch (error) {}
              }),
     
          ElevatedButton.icon(
            onPressed: () {

              if (before_image_taken == false){
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text('Please take a picture.'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          }, // onPressed
                          child: Text('Okay')),
                    ], // actions
                  )
                );
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StopwatchPage())
                );
              }

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StopwatchPage())
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
