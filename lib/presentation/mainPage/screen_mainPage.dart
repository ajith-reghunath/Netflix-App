import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/downloads/screen_downloads.dart';
import 'package:netflix_app/presentation/fastLaugh/screen_fast_laugh.dart';
import 'package:netflix_app/presentation/home/screen_home.dart';
import 'package:netflix_app/presentation/mainPage/widgets/bottom_nav.dart';
import 'package:netflix_app/presentation/new&hot/screen_new&hot.dart';
import 'package:netflix_app/presentation/search/screen_search.dart';

class ScreenMainPage extends StatefulWidget {
  const ScreenMainPage({super.key});

  @override
  State<ScreenMainPage> createState() => _ScreenMainPageState();
}

class _ScreenMainPageState extends State<ScreenMainPage> {

  int selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
  const ScreenHome(),
  const ScreenNewAndHot(),
  const ScreenFastLaugh(),
  const ScreenSearch(),
  const ScreenDownload()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections), label: 'New & Hot'),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions), label: 'Fast Laughs'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.download), label: 'Downloads'),
          ],
          onTap: _navigateBottomBar),
    );
  }
}
