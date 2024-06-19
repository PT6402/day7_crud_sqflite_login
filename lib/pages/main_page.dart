import 'package:day7_crud_sqflite_login/pages/add_page.dart';
import 'package:day7_crud_sqflite_login/pages/home_page.dart';
import 'package:day7_crud_sqflite_login/pages/login_page.dart';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String title;
  const MainPage({super.key, required this.title});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _logout() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

// navigation bar
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = [
    HomePage(),
    AddPage(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      _logout();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[900],
          title: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const CircleAvatar(
                    backgroundImage: AssetImage("images/d1.png"),
                  )),
              Text(widget.title)
            ],
          ),
        ),
        body: SizedBox(
          child: _widgetOptions[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Logout',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}
