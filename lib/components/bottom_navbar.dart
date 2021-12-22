import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movieapp/screens/home_screen.dart';
import 'package:movieapp/screens/bookmarks.dart';
import 'package:movieapp/screens/profile_screen.dart';

class Bottom_Navbar extends StatefulWidget {
  final String username;
  Bottom_Navbar({Key key, this.username}) : super(key: key);

  @override
  _Bottom_NavbarState createState() => _Bottom_NavbarState();
}

class _Bottom_NavbarState extends State<Bottom_Navbar> {
  int currentIndex = 0;
  final List<Widget> body = [
    new HomeScreen(),
    new Bookmarks(),
    new ProfileScreen(username: 'Ridwan'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontap,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Beranda',
            icon: ImageIcon(
              AssetImage('assets/icons/home_3.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Bookmarks',
            icon: ImageIcon(
              AssetImage('assets/icons/bookmark.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profil',
            icon: ImageIcon(
              AssetImage('assets/icons/user_2.png'),
            ),
          ),
        ],
        selectedItemColor: Color(0xFF006699),
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
      ),
    );
  }

  void ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
