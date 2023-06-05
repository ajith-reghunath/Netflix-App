import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(currentIndex: 2,
    backgroundColor: Colors.black,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
      items: [BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.collections),label: 'New & Hot'),
    BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions),label: 'Fast Laughs'),
    BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
    BottomNavigationBarItem(icon: Icon(Icons.download),label: 'Downloads'),
    ]
    );
  }
}
