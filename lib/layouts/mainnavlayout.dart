import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/screens/create-edit-itinerary.dart';
import 'package:tripsharemobile_s4/screens/home.dart';
import 'package:go_router/go_router.dart';

class MainNavLayout extends StatelessWidget {
  final Widget child;

  const MainNavLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/create');
              break; 
            case 2:
              context.go('/account');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
