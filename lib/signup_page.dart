import 'package:firebase_database/firebase_database.dart';
import 'package:litter_app/login_page.dart';
import 'main.dart';
import 'community_sponsor.dart';
import 'package:flutter/material.dart';

String username = '';
String password = '';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirm_passwordController = TextEditingController();

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
          Padding(
            padding: EdgeInsets.all(
              40.0,
            ),
            child: TextField(
              decoration: InputDecoration(labelText: 'Username'),
              controller: usernameController,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
              40.0,
            ),
            child: TextField(
              decoration: InputDecoration(labelText: 'Password'),
              controller: passwordController,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
              40.0,
            ),
            child: TextField(
              decoration: InputDecoration(labelText: 'Confirm password'),
              controller: confirm_passwordController,
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
                  onPressed: () async {
                    bool username_taken = false;
                    if (usernameController.text == '' ||
                        passwordController.text == '') {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text('Please fill in all fields.'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Okay'))
                            ],
                          ));
                    } // end if
                    else if (passwordController.text != confirm_passwordController.text){
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text('Confirm password does not match password.'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Okay')
                              )
                            ], // actions
                          )
                      );
                    } // else if
                    else {
                      DatabaseReference ref = FirebaseDatabase.instance.ref();
                      for (int i = 0; i < length_users+1; i ++) {
                        final snapshot_user_name = await ref.child('users_list/$i/name').get();
                        if (snapshot_user_name.exists) {
                          if (usernameController.text == snapshot_user_name.value) {
                            username_taken = true;
                          }
                        } // end exists
                      } // end for
                      if (username_taken) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text('Username taken.'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Okay'))
                              ],
                            )
                        ); // showDialog
                      } else {
                        print('username not taken');
                        username = usernameController.text;
                        password = passwordController.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CommunitySponsorPage())
                        );
                      } // end else
                    } // else
                  },
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
