import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litter_app/records_page.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref();

class RecordsDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('records display'),
        ),
        body: Column(
          children: [
            const Text('location:'),
            Text(record_location),
            const Text('date:'),
            Text(record_date),
            const Text('volunteered time:'),
            Text(record_volunteered_time),
            const Text('before image:'),
            Image.network(record_before_image),
            const Text('after image:'),
            Image.network(record_after_image)
          ],
        ));
  }
}
