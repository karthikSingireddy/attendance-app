import 'package:flutter/material.dart';

const NavBarItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.list),
    label: 'form submission',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: 'settings',
  ),
];

class NavBar extends StatelessWidget {
  const NavBar({Key key, this.currentIndex, this.onTap}) : super(key: key);

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.amber[200],
      items: NavBarItems,
      onTap: onTap,
    );
  }
}
