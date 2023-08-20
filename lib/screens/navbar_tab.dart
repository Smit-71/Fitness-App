import 'package:flutter/material.dart';
import 'package:flutter_fitness/screens/dashboard.dart';
import 'package:flutter_fitness/screens/profile.dart';
import 'package:flutter_fitness/screens/trainning.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarTab extends StatefulWidget {
  @override
  State<NavbarTab> createState() => _NavbarTabState();
}

class _NavbarTabState extends State<NavbarTab> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      Dashboard(),
      Training(),
      Profile(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff0FB5D8),
        selectedLabelStyle: GoogleFonts.nunito(fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.nunito(),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: size.height * 0.03,
                width: size.height * 0.03,
                child: Image.asset(
                  'assets/grey_home.png',
                ),
              ),
            ),
            label: 'HOME',
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: size.height * 0.03,
                width: size.height * 0.03,
                child: Image.asset(
                  'assets/sign_in_icon1.png',
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: size.height * 0.025,
                width: size.height * 0.025,
                child: Image.asset(
                  'assets/grey_training.png',
                ),
              ),
            ),
            label: 'TRAINNING',
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: size.height * 0.025,
                width: size.height * 0.025,
                child: Image.asset(
                  'assets/blue_trainning.png',
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: size.height * 0.025,
                width: size.height * 0.025,
                child: Image.asset(
                  'assets/grey_profile.png',
                ),
              ),
            ),
            label: 'PROFILE',
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: size.height * 0.025,
                width: size.height * 0.025,
                child: Image.asset(
                  'assets/blue_profile.png',
                ),
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
