import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:core_reader/src/views/pages/discover.dart';
import 'package:core_reader/src/views/pages/comics.dart';
import 'package:core_reader/src/views/pages/manga.dart';
import 'package:core_reader/src/views/pages/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List screens = [const ComicsPage(), const MangaPage(), const DiscoverPage(), const SettingsPage()];
  int currentScreen = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 8, 8, 8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: GNav(
                tabs: const [
                  GButton(icon: LineIcons.meteor, text: "Comics"),
                  GButton(icon: LineIcons.dragon, text: "Manga"),
                  GButton(icon: LineIcons.search, text: "Discover"),
                  GButton(icon: LineIcons.cog, text: "Settings"),
                ],
                onTabChange: (int value) => {
                  setState(() {
                    currentScreen = value;
                  })
                },
                selectedIndex: currentScreen,
                backgroundColor: const Color.fromARGB(255, 8, 8, 8),
                activeColor: Colors.white,
                color: Colors.white,
                rippleColor: Colors.grey[500]!,
                tabBackgroundColor: Colors.black,
                duration: const Duration(milliseconds: 250),
                tabActiveBorder: Border.all(color: Colors.white),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                gap: 10,
                hoverColor: Colors.grey,
              ),
            ),
          )
        ),
        body: screens[currentScreen],
      ),
    );
  }
}