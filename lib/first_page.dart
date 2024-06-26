import 'package:flutter/material.dart';
import 'package:litter_app/find_location_page.dart';
import 'package:litter_app/clean_page.dart';
import 'package:litter_app/info_page.dart';
import 'records_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;
  void _navigateBottonBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const CleanPage(),
    RecordsPage(),
    const InfoPage(),
    const FindLocationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottonBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Records'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'info'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Find A Park'),
        ],
      ),
    );
  }
}