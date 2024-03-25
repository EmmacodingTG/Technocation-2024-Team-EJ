import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:litter_app/listview_firebase.dart/findlocation_page.dart';
class FirestoreService{
final CollectionReference notes = FirebaseFirestore.instance.collection('Park Locations');
Future <void> addNote(String note,textcontroller2){
  return notes.add({
    'Location':note,
'Litter Severity': textcontroller2,

  });
}

 Stream<QuerySnapshot>getNoteStream(){
    final notesStream =
    notes.orderBy(Timestamp.now,descending: true).snapshots();
    return notesStream;}
     Future<void> updateNote(String docID, String newNote,newNote2) {
    return notes.doc(docID).update({
      'Location':newNote2, 'Litter Severity': newNote}
     
      );
    
  }

  Future<void>deletenNotes(String docID)
  {return notes.doc(docID).delete();}
} 
