
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';

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
           
          title: const Text('Records Display'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'Location:',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Text(record_location),
                ],
              ),
       
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: Row(
                      children: [
                        const SizedBox(width: 30,),
                        const Text(
                          'Date:',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                     
                                    const  SizedBox(
                      width: 25,
                    ),
                    Text(record_date), ],
                    ),
                  ),
               const Padding(
                  padding:EdgeInsets.only(top:15),
                  child:  Row(
                     children: [
                       SizedBox(width:30),
                       Text('Volunteered time:',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )),
                     ],
                   ),
                ),
               
              Row(
                children: [
                  SizedBox(width: 35,),
                  Text(record_volunteered_time),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:80),
                child: Row(children: [
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      const Text('before image:',style: TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.bold,
                    ),),
                      Image.file(
                        File(record_before_image),
                        width: 170,
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      const Text('after image:',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                      Image.file(
                        File(record_after_image),
                        width: 170,
                      )
                    ],
                  ),
                ]),
              ),
           Padding(
             padding: const EdgeInsets.only(top:80),
             child: Row(
               children: [
                const SizedBox(width: 240,),
                 Image.asset(
                      'assets/images/logo-removebg-preview.png',
                      width: 150
                    ),
               ],
             ),
           ),  ],
          ),
          
        ));
  }
}
