import 'package:flutter/material.dart';
import 'login_page.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  void start() {}
  @override
  Widget build(context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 193, 238, 197),
            Color.fromARGB(255, 185, 250, 191)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo-removebg-preview.png',
                width: 330
              ),
            SizedBox(height: 30,),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color.fromARGB(57, 5, 84, 37),
                          Color.fromARGB(57, 5, 84, 37)
                        ],
                      ),
                    ),
                  ),
                ),
             
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(top: 5),
                  foregroundColor: const Color.fromARGB(221, 255, 255, 255),
                  textStyle: const TextStyle(
                    fontSize: 40,
                  ),
                ),
                child: const Text('START'),
              )
            ],
          ),
        )])));
  }
}
