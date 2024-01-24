import 'package:ezyscripts/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../constant/colors.dart';
import '../about/about_us.dart';
import '../contact_us/contact_us.dart';
import '../home/home_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens =   [
    const HomeScreen(),
    const AboutUs(),
    const ContactUs(),
    const ProfileScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_screens.elementAt(_selectedIndex) ,
      bottomNavigationBar:  BottomNavigationBar(
        backgroundColor: AppColors.primary,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_support_outlined),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_in_talk_rounded),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedLabelStyle: const TextStyle(
          color: AppColors.primary, // Set the text color for unselected items
        ),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}