import 'package:firebase_database/firebase_database.dart';
import 'package:litter_app/first_page.dart';

import 'package:litter_app/signup_page.dart';
import 'package:flutter/material.dart';
import 'main.dart';


String usernameControllertext = usernameController.text;
 final usernameController = TextEditingController();
  final passwordController = TextEditingController();

int user_index = 0;
String contact_email = '';
DatabaseReference ref = FirebaseDatabase.instance.ref();


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

void signup() {}

class _LoginPageState extends State<LoginPage> {

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const Drawer(child: Text('hEllo World')),
      appBar: AppBar(
                backgroundColor:const  Color.fromARGB(146, 21, 125, 49),
        title: Row(
              children: [ Image.asset('assets/images/user-interface.png',  width: 25,),Container(
                  padding: const EdgeInsets.all(8.0), child:  const Text('Login')),   
              ]
        ),
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
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignupPage(),
              ),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(top: 5),
              foregroundColor: const Color.fromARGB(221, 0, 0, 0),
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
            child: const Text('not yet user? Sign up!',
            style: TextStyle(
                    color: Color.fromARGB(221, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                     decoration: TextDecoration.underline,),

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
                    final snapshot_user_length = await ref.child('users_list').get();
                    if (snapshot_user_length.exists){
                      length_users = (snapshot_user_length.value).toString().split("{'name'").length;
                    }
                    if ((usernameController.text) == '' ||
                        (passwordController.text) == '') {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text('Please enter all fields.'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                }, // onPressed
                                child: Text('Okay')),
                          ], // actions
                        ),
                      ); // showDialog
                    } // end if
                    else {
                      print('restarted');
                      bool username_correct = false;
                      for (int i = 0; i < length_users+1; i ++) {
                        final snapshot_user_name = await ref.child('users_list/$i/name').get();
                        final snapshot_user_password = await ref.child('users_list/$i/password').get();
                        if (snapshot_user_name.exists && snapshot_user_password.exists) {
                          if (usernameController.text == snapshot_user_name.value) {
                            if (passwordController.text == snapshot_user_password.value) {
                              username_correct = true;
                              user_index = i;
                              username = usernameController.text;
                              final snapshot_email = await ref.child('users_list/$user_index/community_sponsor_email').get();
                              if (snapshot_email.exists){
                                contact_email = snapshot_email.value as String;
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const FirstPage())
                              );
                            } // end password
                            else {
                              print('password incorrect');
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: const Text('Username or password incorrect.'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }, // onPressed
                                        child: Text('Okay')),
                                  ], // actions
                                ),
                              ); // showDialog
                            } // end else
                          } // end username
                        } // end exists
                      } // end for
                      if (username_correct == false) {
                        print('username incorrect');
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text('Username or password incorrect.'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }, // onPressed
                                  child: Text('Okay')),
                            ], // actions
                          ),
                        ); // showDialog
                      } // end if
                    } // end else
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(top: 5), // try doing tutorial invisible box padding thingy
                    foregroundColor: const Color.fromARGB(221, 0, 0, 0),
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  child: const Text('LOGIN'),
                ),
              ],
            ),
          )]));
    
      
  }
}
