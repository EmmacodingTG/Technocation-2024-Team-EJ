import 'package:litter_app/pages.dart/signup_map_page.dart';
import 'package:flutter/material.dart';

class SignupContactPage extends StatefulWidget {
  const SignupContactPage({super.key});

  @override
  State<SignupContactPage> createState() => _SignupContactPageState();
}

class _SignupContactPageState extends State<SignupContactPage> {
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
          Container(padding: const EdgeInsets.all(8.0), child: const Text('Add Contacts')),
        ]),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(
              15.0,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Please add contacts of your teacher',
                style: TextStyle(
                  color: Color.fromARGB(221, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                   decoration: TextDecoration.underline,
                   decorationColor: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(
              40.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                label: Text('Name'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(
              40.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                label: Text('Email'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(
              40.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                label: Text('Phone Number'),
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
                          Color.fromARGB(115, 17, 223, 99),
                          Color.fromARGB(115, 17, 223, 99)
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpMapPage(),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(top: 5),
                    foregroundColor: const Color.fromARGB(221, 0, 0, 0),
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  child: const Text('DONE!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
