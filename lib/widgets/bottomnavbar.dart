import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final Widget child;
  final int selectedIndex;

  const BottomNavBar({required this.child, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF546A83),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.house)),
          BottomNavigationBarItem(icon: Icon(Icons.playlist_add_circle_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline))
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
        } ,
      ),
    );
  }
}
