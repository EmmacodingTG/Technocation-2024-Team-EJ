import 'package:flutter/material.dart';
import 'package:litter_app/first_page.dart';


class InfoPage extends StatelessWidget {
  const InfoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              height: 110,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(146, 21, 125, 49)),
              child: Row(
                children: [
                  IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FirstPage(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Instructions',
                    style: TextStyle(
                      color: Color.fromARGB(221, 5, 5, 5),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
          const Padding(padding: EdgeInsets.only(top: 15)),
          Row(
            children: [
              const SizedBox(width: 30),
              Image.asset('assets/images/button.png', width: 20),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Find, search, and change parks.',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),SizedBox(width:10),
               Image.asset('assets/images/button.png', width: 20),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
          ),
          const Row(
            children: [
            SizedBox(
                width: 15,
              ),
             
             SizedBox(
                width: 20,
              ),
             Text(
                '- Find parks available along with its litter severity \nwithin the “Find Location” Navigation section.',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
           const Padding(
             padding:  EdgeInsets.only(top:10),
             
             child: Row(
               children: [SizedBox(
                width: 35,
              ),
                 Text(
                      '- Add/Edit/or Delete a park location’s litter density in \nthe“Find Location” Navigation section if any update\n is needed.',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),

                    ),
               ],
             ),
           ),
           const  Padding(
             padding:  EdgeInsets.only(top:10),
             
             child: Row(
               children: [SizedBox(
                width: 35,
              ),
                 Text(
                      '- After choosing a park, the map In the first page\n allows users to locate the address, and start their\n volunteer hours!.',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),

                    ),
               ],
             ),
           ),
           
           const Padding(padding: EdgeInsets.only(top: 15)),
          Row(
            children: [
              const SizedBox(width: 60),
              Image.asset('assets/images/button.png', width: 20),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Submitting and cleaning:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),SizedBox(width:10),
               Image.asset('assets/images/button.png', width: 20),
            ],
          ),
          const  Padding(
             padding:  EdgeInsets.only(top:10),
             
             child: Row(
               children: [SizedBox(
                width: 35,
              ),
                 Text(
                      '- When starting a cleaning session, press the \nbutton clean as it will lead you through the process of\n completing your volunteer hours.',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),

                    ),
               ],
             ),
           ),
         const  Padding(
             padding:  EdgeInsets.only(top:10),
             
             child: Row(
               children: [SizedBox(
                width: 35,
              ),
                 Text(
                      '1. Capture a before photo by pressing the camera \nicon, and send to your sponsor as an email.',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),

                    ),
               ],
             ),
           ),
            const  Padding(
             padding:  EdgeInsets.only(top:10),
             
             child: Row(
               children: [SizedBox(
                width: 35,
              ),
                 Text(
                      '2.Insert your address, the date, and time your \nsession, these information would be sent to your sponsor.',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),

                    ),
               ],
             ),
           ),
            const  Padding(
             padding:  EdgeInsets.only(top:10),
             
             child: Row(
               children: [SizedBox(
                width: 35,
              ),
                 Text(
                      '3. Capture an after photo and send to your sponsor\n as an email.',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),

                    ),
               ],
             ),
           ),
            const  Padding(
             padding:  EdgeInsets.only(top:10),
             
             child: Row(
               children: [SizedBox(
                width: 35,
              ),
                 Text(
                      '4. Lastly, press “ Hand in Report” to submit your \n progress to your sponsor through a separate email. ',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),

                    ),
               ],
             ),
           ),
           
         
          const  Padding(padding: EdgeInsets.only(top: 30)),
        
         
           Row(
            
             children: [
              const SizedBox(
                width: 30,
              ),
               Image.asset(
            'assets/images/smile.png',
            width: 25,
          ),
          const SizedBox(
                width: 10,
              ),
               Text('#1 = Good'),
               const SizedBox(
                width: 60,
              ),
                Image.asset(
            'assets/images/right-arrow.png',
            width: 25,
          ),
          const SizedBox(
                width: 60,
              ),
               const Text('#5 = Bad'),
               const SizedBox(
                width: 5,
              ),
                Image.asset(
            'assets/images/sad.png',
            width: 25,
          ),
             ],
           ),
           
        ],
      ),
    );
  }
}
