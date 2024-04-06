import 'dart:ffi';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litter_app/records_page.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref();

class RecordsDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(146, 21, 125, 49),
          
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
            Row(
              children: [
SizedBox(width:20),
               Column(
                 children: [
                   const Text('before image:'),
                 Image.file(File(record_before_image),
      width: 170,),    ],
               ),
          SizedBox(width:20)    ,
         
            Column(
              children: [
                const Text('after image:'),
           Image.file( File(record_after_image),width: 170,)   ],
            ),

            
        ])  ],
        ));
  }
}
