import 'package:flutter/material.dart';
import 'package:litter_app/gradient_container.dart';

void main() {
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
