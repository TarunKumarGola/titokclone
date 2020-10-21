import 'package:flutter/material.dart';
import 'package:titokclone/addvideo.dart';
import 'package:titokclone/messagepage.dart';
import 'package:titokclone/profilepage.dart';
import 'package:titokclone/searchpage.dart';
import 'package:titokclone/variable.dart';
import 'package:titokclone/video.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pageoptions = [
    VideoPage(),
    SearchPage(),
    AddVideo(),
    MessagePage(),
    ProfilePage()
  ];
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageoptions[page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        currentIndex: page,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add video",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
