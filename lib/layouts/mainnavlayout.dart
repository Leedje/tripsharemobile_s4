import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/screens/create-edit-itinerary.dart';
import 'package:tripsharemobile_s4/screens/home.dart';

class MainNavLayout extends StatefulWidget {
  @override
  _MainNavLayoutState createState() => _MainNavLayoutState();
}

class _MainNavLayoutState extends State<MainNavLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [HomeScreen(), CreateEditItineraryScreen(), Placeholder()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
           BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
