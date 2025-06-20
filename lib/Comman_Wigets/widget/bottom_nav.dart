import 'package:expense_tracker_app/Modules/dashboard/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  final PageController _pageViewController = PageController();
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final iconsize = screenWidth * .065;
    final navbarheigth = screenWidth * .23;

    final fontsize = screenWidth * .03;

    return Scaffold(
      body: PageView(physics: NeverScrollableScrollPhysics(),
        controller: _pageViewController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          Homepage(),
        ],
      ),
      bottomNavigationBar: Container(
        height:  navbarheigth,
        decoration: BoxDecoration(

            border: Border(
                top: BorderSide(
                    color: Color(0xFFF0EFEF),width: 1
                )
            )
        ),
        child: BottomNavigationBar(

            backgroundColor: Colors.white,
            iconSize: iconsize,
            selectedLabelStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w600, fontSize: fontsize,
            ),
            unselectedLabelStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500, fontSize: fontsize,
            ),

            selectedItemColor: Color(0xFF0CA201),
            unselectedItemColor:  Color(0xFF000000),
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
              _pageViewController.jumpToPage(index);
            },items: [
          BottomNavigationBarItem(icon: Column( mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.home_outlined),
              SizedBox(height: screenWidth*.01,),
            ],
          ), label: 'Home'),
          BottomNavigationBarItem(icon:Column( mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.favorite_border),
              SizedBox(height: screenWidth*.01,),
            ],),label: 'Favourite'),
          BottomNavigationBarItem(
              icon:Column( mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search_rounded),
                  SizedBox(height: screenWidth*.01,),
                ],),label: 'Search'),
          BottomNavigationBarItem(
              icon: Column( mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person_outline),
                  SizedBox(height: screenWidth*.01,),
                ],), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Column( mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.menu),
                  SizedBox(height: screenWidth*.01,),
                ],), label: 'Menu'),
        ]),
      ),
    );
  }
}
