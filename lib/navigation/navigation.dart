import 'package:flutter/material.dart';
import 'package:learning_10c/navigation/home.dart';
import 'package:learning_10c/navigation/profile.dart';
import 'package:learning_10c/navigation/reservations.dart';
import 'package:learning_10c/navigation/top.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    Top(),
    const Reservations(),
    const Profile()
  ];

  void _onItemTapped(int index) {
    setState(() { // Debe de ir este setState para que flutter sepa que hay una renderizacion nueva
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Top 5',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Reservaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 128, 0, 255),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
