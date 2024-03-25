/*
import 'package:litter_app/login_page.dart';
import 'package:litter_app/community_sponsor.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const Drawer(child: Text('hEllo World')),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(146, 21, 125, 49),
        title: Row(children: [
          Image.asset(
            'assets/images/user-interface.png',
            width: 25,
          ),
          Container(padding: const EdgeInsets.all(8.0), child: const Text('Sign Up')),
        ]),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
          const Padding(
            padding: EdgeInsets.all(
              40.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                label: Text('Username'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(
              40.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                label: Text('Password'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(
              40.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                label: Text('Confirm password'),
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
              foregroundColor: const Color.fromARGB(221, 0, 0, 0),
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
            child: const Text(
              'Already have an account? Login!',
              style: TextStyle(
                color: Color.fromARGB(221, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color.fromARGB(58, 17, 223, 99),
                          Color.fromARGB(58, 17, 223, 99)
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupContactPage(),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(top: 5),
                    foregroundColor: const Color.fromARGB(221, 0, 0, 0),
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  child: const Text('Sign Up!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

 */