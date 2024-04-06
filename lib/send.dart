import 'package:flutter/material.dart';
import 'package:litter_app/find_location_page.dart';
import 'package:litter_app/stopwatch_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login_page.dart';
import 'stopwatch_page.dart';


String contact_email = '';

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
    // create global variable of timer and contacts ( put contacts email into the recipient's email )

    var subject = '';
    var message =
        "Hello, this is a message about________'s cleaning session."; // __ replaced by textediting controller variable of username from login or sign up page
    var message2 = 'Address:';
    var message3 = 'Cleaning date:  ';
    var message4 = 'Total Cleaning Time:  ';
    var message5 =
        'Images of this volunteer activity was sent previously within two separate emails. Please check your inbox!)';
    var message6 =
        'Please confirm this volunteer.\n\nThank you!\n\n From: LITTER APP';
    var Enter = '\n\n';

    String DateTimeString = date;

    String messageperiode = message + " " + Enter;

    String fullmessage = messageperiode +
        " " +
        message2 +
        " " +
        addressTextEditingController.text +
        " " +
        Enter +
        " " +
        message3 +
        "" +
        DateTimeString +
        " " +
        Enter +
        " " +
        message4 +
        "" +
        time;
    " " + Enter + " " + message5 + " " + Enter + " " + message6;

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
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: const Color.fromARGB(146, 122, 228, 150),
                      content: const Text('Now displayed in records'),
                      action: SnackBarAction(
                        label: 'Update Littery Severity',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FindLocationPage(),
                          ),
                        ),
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
