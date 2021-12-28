import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoaded = false;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();

    // make _isLoaded true after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161621),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.blueGrey,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.blueGrey,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.blueGrey,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        margin: const EdgeInsets.only(bottom: 30, top: 10, right: 20, left: 20),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.white),
          SalomonBottomBarItem(
              icon: const Icon(Icons.explore_outlined),
              title: const Text("Likes"),
              selectedColor: Colors.pink),
          SalomonBottomBarItem(
              icon: const Icon(Icons.data_usage),
              title: const Text("Search"),
              selectedColor: Colors.orange),
          SalomonBottomBarItem(
              icon: const Icon(Icons.settings),
              title: const Text("Profile"),
              selectedColor: Colors.teal)
        ],
      ),
    );
  }
}
