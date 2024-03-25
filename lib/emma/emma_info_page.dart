/*
import 'package:flutter/material.dart';
import 'package:litter_app/navigator_bar.dart';


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
              height: 118,
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
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
          const Padding(padding: EdgeInsets.only(top: 30)),
          Row(
            children: [
              const SizedBox(width: 15),
              Image.asset('assets/images/button.png', width: 20),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Squares indicate area with litter density.',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Image.asset('assets/images/button.png', width: 20),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Please click "Add Square" to add a square.',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Image.asset('assets/images/button.png', width: 20),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Please use the search bar to search ',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const Row(
            children: [
              SizedBox(
                width: 45,
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
          Text(
                'for specific locations',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(top: 50)),
              const SizedBox(
                width: 15,
              ),
              Image.asset('assets/images/button.png', width: 20),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Number in the squares indicate the',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const Row(
            children: [
              SizedBox(
                width: 45,
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
               Text(
                'severity of litter pollution in the area.',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const  Padding(padding: EdgeInsets.only(top: 45)),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Image.asset('assets/images/button.png', width: 20),
              const SizedBox(
                width: 10,
              ),
             const Text(
                'Table of Indications',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                   decoration: TextDecoration.underline,

                ),
              ),
               const SizedBox(
                width: 15,
              ),
              Image.asset('assets/images/button.png', width: 20),

            ],
          ), const Padding(padding: EdgeInsets.only(top:10)),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Table(
                border: TableBorder.all(
                  color: const Color.fromARGB(255, 46, 137, 49),
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Image.asset(
                          'assets/images/square.png',
                          width: 250,
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Image.asset(
                          'assets/images/square (1).png',
                          width: 250,
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Image.asset(
                          'assets/images/square (2).png',
                          width: 250,
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Image.asset(
                          'assets/images/square (3).png',
                          width: 250,
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Image.asset(
                          'assets/images/square (4).png',
                          width: 250,
                        ),
                      ),
                    ],
                  ),
                  ...List.generate(
                      1,
                      (index) => const TableRow(children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text('2',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text('3',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text(
                                    '4',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text('5',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                            ),
                          ]))
                ],
              ),
            ),
          ),
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
               Text('Good'),
               const SizedBox(
                width: 85,
              ),
                Image.asset(
            'assets/images/right-arrow.png',
            width: 25,
          ),
          const SizedBox(
                width: 85
              ),
               Text('Bad'),
               const SizedBox(
                width: 10,
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

 */