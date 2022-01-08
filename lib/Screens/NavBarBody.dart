import 'package:flutter/material.dart';
import 'package:rinse/Screens/Home.dart';
import 'package:rinse/Screens/MyProfile.dart';
import 'package:rinse/Screens/Orders.dart';
import 'package:rinse/Screens/Pricing.dart';

class NavBarBody extends StatefulWidget {
  const NavBarBody({Key? key}) : super(key: key);

  @override
  _NavBarBodyState createState() => _NavBarBodyState();
}

class _NavBarBodyState extends State<NavBarBody> {
  int pageIndex = 0;
  List<Widget> pages = [Home(), Orders(), Pricing(), MyProfile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(icon: Image.asset("assets/images/Menu.png"), activeIcon: Image.asset("assets/images/MenuSelected.png"), label: ""),
          BottomNavigationBarItem(icon: Image.asset("assets/images/Orders.png"), activeIcon: Image.asset("assets/images/OrdersSelected.png"), label: ""),
          BottomNavigationBarItem(icon: Image.asset("assets/images/Pricing.png"), activeIcon: Image.asset("assets/images/PricingSelected.png"), label: ""),
          BottomNavigationBarItem(icon: Image.asset("assets/images/Profile.png"), activeIcon: Image.asset("assets/images/ProfileSelected.png"), label: ""),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset("assets/images/CenterButton.png"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
