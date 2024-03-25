import 'dart:ffi';
import 'package:litter_app/global_variable.dart'; 
import 'package:flutter/material.dart';
import 'package:litter_app/pages.dart/after_picture.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {


  DateTime _dateTime = DateTime.now();


 
void _showDatePicker() {
  showDatePicker(
    context: context,
    initialDate: DateTime(2024, 3, 15),
    firstDate: DateTime(2000),
    lastDate: DateTime(2025),
  ).then((pickedDate) {
    if (pickedDate != null) {
      setState(() {
        _dateTime = pickedDate; 
        selectedDate = pickedDate; 
      });
    }
  });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(146, 21, 125, 49),
        title: const Text('Step 2: Time Your Cleaning'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 30),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Cleaning:',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                     decorationColor: Color.fromARGB(146, 21, 125, 49),
                        decorationThickness: 2,
       
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  'assets/images/data-cleaning.png',
                  width: 45,
                ),
              ),
            ],
          ),
          const Row(
            children: [
              SizedBox(width: 30),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text('Address:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
            ],
          ),
            Padding(
              padding: const EdgeInsets.only(left:30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter copied address',
                  border:  OutlineInputBorder(),
                ),
                controller: addressTextEditingController,
              ),
            ),
              
            
          
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ElevatedButton.icon(
              onPressed: _showDatePicker,
              label: const Text('Choose Date'),
              icon: const Icon(Icons.calendar_month),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                SizedBox(width: 30),
                Text(
                  'Chosen Date:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 30),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  _dateTime.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AfterPicturePage(),
                  ),
                ),
                label: const Text('NEXT'),
                icon: const Icon(Icons.done),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
