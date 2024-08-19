import 'package:flutter/material.dart';
import 'DailyHoroscope.dart';
import 'CoffeeFortune.dart';
import 'TarotReadingScreen.dart';
import 'Profile.dart';
import 'NftPage.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Define screens
  final List<Widget> _screens = [
    HoroscopeScreen(),
    const CoffeeFortuneScreen(),
    const TarotReadingScreen(),
    const NftCardScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Show selected screen

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.star), // Burç ikonu
            label: '', // Empty label
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.coffee), // Kahve ikonu
            label: '', // Empty label
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/tarot-card.png",
              width: 24,
              height: 24,
              color: _selectedIndex == 2 ? Colors.deepOrange : Colors.grey, // Change color based on selection
            ),
            label: '', // Empty label
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/nft.png",
              width: 24,
              height: 24,
              color: _selectedIndex == 3 ? Colors.deepOrange : Colors.grey, // Change color based on selection
            ),
            label: '', // Empty label
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange, // Selected icon color
        unselectedItemColor: Colors.grey, // Unselected icon color
        showUnselectedLabels: false, // Hide unselected labels
        type: BottomNavigationBarType.fixed, // Keep icons the same size
        backgroundColor: Colors.black, // Bottom bar background color
        onTap: _onItemTapped, // Icon tap event
      ),
    );
  }
}
