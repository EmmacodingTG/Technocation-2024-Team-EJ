import 'package:litter_app/login_page.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  void start() {}
  @override
  Widget build(context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 169, 230, 174),
            Color.fromARGB(255, 137, 250, 143)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/throw-trash.png',
                width: 250,
              ),
              const SizedBox(height: 30),
              const Text(
                'Litter App',
                style: TextStyle(
                    color: Color.fromARGB(221, 255, 255, 255),
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ), const SizedBox(height: 10),
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
                    fontSize: 20,
                  ),
                ),
                child: const Text('START'),
              )
            ],
          ),
        )])));
  }
}
