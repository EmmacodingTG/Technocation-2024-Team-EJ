import 'package:flutter/material.dart';
import 'package:litter_app/gradient_container.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:litter_app/firebase_options.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform); 

  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ),
      ),
      home: const Scaffold(
        body: GradientContainer(),
      ),
    ),
  );
}
