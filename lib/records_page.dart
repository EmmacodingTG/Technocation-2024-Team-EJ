import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:litter_app/records_display.dart';
import 'login_page.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref();

String record_location = '';
String record_date = '';
String record_volunteered_time = '';
String record_before_image = '';
String record_after_image = '';

class RecordsPage extends StatefulWidget {

  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {

  Query records_ref = FirebaseDatabase.instance.ref().child('users_list/$user_index/records');

  Widget listItem({required Map record}) {
    return Card(
      child: ListTile(
        title: Text(record['location']),
        subtitle: Text(record['volunteered_time']),
        onTap: () async {
          record_location = record['location'];
          record_date = record['date'];
          record_volunteered_time = record['volunteered_time'];
          record_before_image = record['before_image'];
          record_after_image = record['after_image'];
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RecordsDisplay())
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: 
             FirebaseAnimatedList(
                  query: records_ref,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                    Map record = snapshot.value as Map;
                    record['index'] = user_index;
                    return listItem(record: record);
                  }
               
        ),
    );
  }
}