import 'package:firebase_database/firebase_database.dart';
import 'package:litter_app/signup_page.dart';
import 'main.dart';
import 'location_select.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login_page.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref();

class CommunitySponsorPage extends StatefulWidget {
  const CommunitySponsorPage({super.key});

  @override
  State<CommunitySponsorPage> createState() => _CommunitySponsorState();
}

class _CommunitySponsorState extends State<CommunitySponsorPage> {

  final community_sponsor_nameController = TextEditingController();
  final community_sponsor_emailController = TextEditingController();
  final community_sponsor_phoneController = TextEditingController();

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

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
                'Please add contacts of your teacher/community sponsor',
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
          Padding(
            padding: const EdgeInsets.all(
              40.0,
            ),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Name'),
              controller: community_sponsor_nameController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              40.0,
            ),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              controller: community_sponsor_emailController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              40.0,
            ),
            child: TextField(
              decoration:const  InputDecoration(labelText: 'Phone Number'),
              controller: community_sponsor_phoneController,
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
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text('Are you sure the information is correct?'),
                          actions: [
                            TextButton(onPressed: () async {
                              // store in Firebase

                              DatabaseReference users_list = FirebaseDatabase.instance.ref('users_list');
                              DatabaseReference new_user = users_list.child('${length_users+1}');
                              new_user.set({
                                'name': username,
                                'password': password,
                                'community_sponsor_name': community_sponsor_nameController.text,
                                'community_sponsor_email': community_sponsor_emailController.text,
                                'community_sponsor_phone': community_sponsor_phoneController.text,
                                'records': [],
                              });
                              user_index = length_users+1;

                              // send email

                              String community_sponsor_name = community_sponsor_nameController.text;
                              String subject = '$username has added you to be their community sponsor on the Litter App';
                              String message = "" +
                                  "Hi $community_sponsor_name,\n\n"
                                      "$username has added you to be their community sponsor through the Litter App. In the future, you "
                                      "may receive emails of their clean-up reports through this email address. Thank you for your "
                                      "help.\n\n"
                                      "Sincerely,\n"
                                      "Team EJ";

                              Uri uri = Uri(
                                  scheme: 'mailto',
                                  path: community_sponsor_emailController.text,
                                  query: encodeQueryParameters(<String, String>{
                                  'subject': subject,
                                  'body': message
                                  }),
                              );
                              launchUrl(uri);

                              // save contact email
                              final snapshot_email = await ref.child('users_list/$user_index/community_sponsor_email').get();
                              if (snapshot_email.exists){
                                contact_email = snapshot_email.value as String;
                              }

                              // navigate to next screen

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LocationSelectPage())
                              );
                            }, child: const Text('yes')),
                            TextButton(onPressed: () {
                              Navigator.pop(context);
                            }, child: const Text('no'))
                          ],
                        )
                    ); // showDialog
                  },
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
