import 'package:expense_tracker_app/Modules/dashboard/view/homepage.dart';
import 'package:expense_tracker_app/Modules/Statistics/view/statistics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Modules/Expense/view/expense.dart';
import '../../Modules/Profile/view/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final PageController _pageViewController = PageController();
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Homepage(),               // Home Screen
    Statistics(),
    ExpenseScreen(),
    Profile(),

  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final iconSize = screenWidth * 0.065;
    final navbarHeight = screenWidth * 0.23;
    final fontSize = screenWidth * 0.03;

    return Scaffold(

      body: PageView(
        controller: _pageViewController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: navbarHeight,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFFF0EFEF), width: 1)),
        ),
        child: BottomNavigationBar(

          backgroundColor: Colors.white,
          iconSize: iconSize,
          selectedLabelStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
          ),
          unselectedLabelStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: fontSize,
          ),
          selectedItemColor: Color.fromRGBO(84, 153, 148, 1),
          unselectedItemColor: Color.fromRGBO(170, 170, 170, 1),
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            _pageViewController.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Statistics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: 'Wallet',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
