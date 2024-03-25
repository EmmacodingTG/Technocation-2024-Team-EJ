import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:litter_app/listview_firebase.dart/firestore.dart';
import 'package:litter_app/pages.dart/first_page.dart';

import 'package:clipboard/clipboard.dart';
class FindLocationPage extends StatefulWidget {
  const FindLocationPage({super.key});

  @override
  State<FindLocationPage> createState() => _FindLocationPageState();
}

class _FindLocationPageState extends State<FindLocationPage> {
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

  void openNoteBox({String? docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                children: [
                  TextField(controller: textcontroller),
                  TextField(controller: textcontroller2),
                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      if (docID == null) {
                        firestoreService.addNote(
                            textcontroller.text, textcontroller2.text);
                      } else {
                        firestoreService.updateNote(
                            docID, textcontroller2.text, textcontroller.text);
                      }

                      textcontroller2.clear();
                      Navigator.pop(context);
                      textcontroller.clear();
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FirstPage(),
                        ),
                      );
                    },
                    child: Text('ADD')),
              ElevatedButton(onPressed:()=>Navigator.pop(context) , child: Text('Cancel'))],
            ));
  }

  final CollectionReference notes =
      FirebaseFirestore.instance.collection('Park Locations');

  final FirestoreService firestoreService = FirestoreService();

  final TextEditingController textcontroller = TextEditingController();

  final _userStream = FirebaseFirestore.instance.collection('Park Locations').snapshots();

  TextEditingController textcontroller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(146, 21, 125, 49),
          leading: IconButton(
            icon: Icon(Icons.location_on),
            iconSize: 50,
            onPressed: 
               () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FirstPage(),
                          ),
                        )
            
          ),
          title: const Text('Find A Park'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            openNoteBox();
          },
          child: const Icon(Icons.add),
        ),
        body: StreamBuilder(
          stream: _userStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Error');
            }
            var docs = snapshot.data!.docs;

            //return Text('${docs.length}');
            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = docs[index];
                  String docID = document.id;
                  return ListTile(
                      title: Text(docs[index]['Location']),
                      subtitle: Text('${docs[index]['Litter Severity']}'),
                      
                      trailing: Row(
                       mainAxisSize:  MainAxisSize.min,children: [
                        IconButton(
                          onPressed: () => openNoteBox(docID: docID),
                          icon: Icon(Icons.edit),
                        ),
                       IconButton(
                          onPressed: () => firestoreService.deletenNotes(docID),
                          icon: Icon(Icons.delete),
                        ), 
                         InkWell(
                      onTap: () {
                        FlutterClipboard.copy(docs[index]['Location'].toString());
                      },
                      child: const Icon(Icons.copy),
                    ),]));
                });
          },
        ));
  }
}
