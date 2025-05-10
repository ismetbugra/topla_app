import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'home_screen.dart';
import 'find_player_screen.dart';
import 'find_opponent_screen.dart';
import 'reservation_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return const [
      HomeScreen(),
      FindPlayerScreen(),
      FindOpponentScreen(),
      ReservationScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Ana Ekran"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
        iconSize: 30.0,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_search),
        title: ("Oyuncu Bul"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
        iconSize: 30.0,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.sports_soccer,
          color: Colors.white,
        ),
        title: ("Rakip Bul"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
        iconSize: 30.0,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calendar_today),
        title: ("Rezervasyon"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
        iconSize: 30.0,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profilim"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
        iconSize: 30.0,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardAppears: true,
      navBarStyle: NavBarStyle.style15,
      bottomScreenMargin: 0,
      navBarHeight: 70.0,
      onItemSelected: (index) {
        setState(() {});
      },
      margin: const EdgeInsets.only(top: 20.0),
    );
  }
}
