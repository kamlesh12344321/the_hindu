import 'package:flutter/material.dart';
import 'package:the_hindu/pages/brifeing_page.dart';
import 'package:the_hindu/pages/home_page.dart';
import 'package:the_hindu/pages/my_account_page.dart';
import 'package:the_hindu/pages/premium_page.dart';
import 'package:the_hindu/pages/trending_page.dart';
import 'package:the_hindu/widgets/nav_bar.dart';
import 'package:the_hindu/widgets/the_hindu_appbar.dart';

class TheHinduBottomNav extends StatefulWidget {
  const TheHinduBottomNav({Key? key}) : super(key: key);

  @override
  State<TheHinduBottomNav> createState() => _TheHinduBottomNavState();
}

class _TheHinduBottomNavState extends State<TheHinduBottomNav> {
  int _pageIndex = 0;
  late PageController _pageController;
  List<Widget> tabPages = [
     const HomePage(),
     const BriefingPage(),
   const TrendingPage(),
   PremiumPage(),
  const MyAccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: const TheHinduAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Breifing"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Trending"),
          BottomNavigationBarItem(
              icon: Icon(Icons.wrong_location), label: "Premium"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "My Account")
        ],
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      _pageIndex = page;
    });
  }


  void onTabTapped(int index) {
    setState(() {
      _pageIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
