import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:litter_app/find_location_page.dart';
import 'package:litter_app/signup_page.dart';
import 'package:litter_app/stopwatch_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'clean_page.dart';
import 'login_page.dart';

String contact_email = '';
int length_records = 0;

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  DateTime? selectedDate;
  final TextEditingController addressTextEditingController =
      TextEditingController();

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    var subject = '';
    var message = "Hello,\n\n"
        "This is a message about $username's cleaning session."; // __ replaced by textediting controller variable of username from login or sign up page
    var message2 = 'Address: $user_location';
    var message3 = 'Cleaning date: $user_date';
    var message4 = 'Total cleaning time: $user_time';
    var message5 = 'The before and after images were sent earlier to your inbox.';
    var message6 = 'Please reach out to $username if there are any issues.\n\nThank you!\n\nFrom: Greener Parks';

    // create global variable of timer and contacts ( put contacts email into the recipient's email )

    var Enter = '\n\n';

    String messageperiode = message + Enter;

    String fullmessage = messageperiode +
        message2 +
        address +
        Enter +
        message3 +
        Enter +
        message4 +
        Enter +
        message5 +
        Enter +
        message6;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(146, 21, 125, 49),
          title: Row(children: [
            Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Last Step: Hand in Report')),
          ]),
        ),
        body: Column(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                'assets/images/gmail.png',
                width: 200,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton.icon(
                onPressed: () async {
                  final snapshot_email = await ref
                      .child('users_list/$user_index/community_sponsor_email')
                      .get();
                  if (snapshot_email.exists) {
                    contact_email = snapshot_email.value as String;
                  }
                  Uri uri = Uri(
                    scheme: 'mailto',
                    path: contact_email,
                    query: encodeQueryParameters(<String, String>{
                      'subject': subject,
                      'body': fullmessage
                    }),
                  );
                  launchUrl(uri);
                },
                label: const Text('Hand In Report'),
                icon: const Icon(Icons.send),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton.icon(
                onPressed: () async {
                  final snapshot_records_length =
                      await ref.child('users_list/$user_index/records').get();
                  if (snapshot_records_length.exists) {
                    length_records = (snapshot_records_length.value)
                        .toString()
                        .split("{'after_image'")
                        .length;
                  }
                  DatabaseReference records_list = FirebaseDatabase.instance.ref('users_list/$user_index/records');
                  DatabaseReference new_record = records_list.child('${length_records + 1}');
                  new_record.set({
                    'after_image': user_after_image,
                    'before_image': user_before_image,
                    'date': user_date,
                    'location': user_location,
                    'volunteered_time': user_time,
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: const Color.fromARGB(146, 122, 228, 150),
                      content: const Text('Now displayed in records'),
                      action: SnackBarAction(
                        label: 'Update Litter Severity',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FindLocationPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                label: const Text('Done'),
                icon: const Icon(Icons.done),
              ),
            ),
          ),
        ]));
  }
}
