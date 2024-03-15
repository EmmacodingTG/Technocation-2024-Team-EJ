import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litter_app/first_page.dart';
import 'package:url_launcher/url_launcher.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}



class _SendPageState extends State<SendPage> {
  String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

  @override
  Widget build(BuildContext context) {
    var subject = 'Confirmation of litter cleaning';
   var message = "Hello, this is a message about ________'s cleaning session.Address:___ \n\nCleaning date:__/__/__\n\n Total Cleaning Time __:__ \n\nBelow are the images of this volunteer activity:(user please input image)\n \n \n\n\n\nPlease confirm this volunteer.\n\nThank you!\n\n From: LITTER APP";

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
                onPressed: () {
                 Uri uri = Uri( 
                  scheme:'mailto',
                  path:'',
                  query:encodeQueryParameters(<String,String>{
                    'subject': subject,
                    'body': message,
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
                      backgroundColor: Color.fromARGB(146, 122, 228, 150),
                      content: Text('Now displayed in records'),
                      action: SnackBarAction(
                        label: 'DONE',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FirstPage(),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                label: const Text('DONE'),
                icon: const Icon(Icons.done),
              ),
            ),
          ),
        ]));
  }
}
