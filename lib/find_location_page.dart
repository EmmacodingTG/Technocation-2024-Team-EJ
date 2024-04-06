import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:litter_app/firestore.dart';
import 'package:clipboard/clipboard.dart';
import 'package:litter_app/clean_page.dart';
import 'package:litter_app/first_page.dart';


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
                      if (docID == null) { ///////
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
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'))
              ],
            ));
  }

  final CollectionReference notes =
      FirebaseFirestore.instance.collection('Park Locations');

  final FirestoreService firestoreService = FirestoreService();

  final TextEditingController textcontroller = TextEditingController();

  final _userStream =
      FirebaseFirestore.instance.collection('Park Locations').snapshots();

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
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CleanPage(),
                    ),
                  )),
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

            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = docs[index];
                  String docID = document.id;
                  return ListTile(
                      title: Text(docs[index]['Location']),
                      subtitle: Text('${docs[index]['Litter Severity']}'),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        IconButton(
                          onPressed: () => openNoteBox(docID: docID),
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(width: 80),
                                            Image.asset(
                                              'assets/images/alert.png',
                                              width: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            const Text(
                                              'DELETE?',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    221, 255, 255, 255),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Image.asset(
                                              'assets/images/alert.png',
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                       const Row(
                                          children: [
                                            SizedBox(width: 40),
                                             Text(
                                              'Are you sure you want to delete\nthis location?',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    221, 255, 255, 255),
                                                fontSize: 15,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('No'),
                                        ),
                                        const SizedBox(
                                          width: 90,
                                        ),
                                        TextButton(
                                          child: const Text('Yes'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            firestoreService.deleteNotes(docID);
                                          },
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            FlutterClipboard.copy(
                                docs[index]['Location'].toString());
                          },
                          child: const Icon(Icons.copy),
                        ),
                      ]));
                });
          },
        ));
  }
}