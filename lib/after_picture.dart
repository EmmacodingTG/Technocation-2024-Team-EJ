import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:litter_app/send.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AfterPicturePage extends StatefulWidget {
  const AfterPicturePage({super.key});
  @override
  State<AfterPicturePage> createState() => _AfterPicturePageState();
}

class _AfterPicturePageState extends State<AfterPicturePage> {

  @override
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
                'AFTER PHOTO:',
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
              const SizedBox(
                width: 75,
              ),
              Text(contact_email),
             const  SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
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
                print('${file.path}');
            
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
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SendPage(),
              ),
            ),
            label: const Text('DONE'),
            icon: const Icon(Icons.done),
          ),
        ],
      ),
    );
  }
}
