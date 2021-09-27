import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/my_provider.dart';

import '../main.dart';
import 'favorites.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  final List<Map<String,Object>> pages = [
    {
      'page':MyHomePage(),
    },
    {
      'page':Favorites(),
    }
  ];




  int selectedPageIndex = 0;

  void selectPage (int value){
    setState(() {
      selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Provider.of<MyProvider>(context).backColor == Colors.white?Colors.black:Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.red,
        selectedFontSize: 17,
        unselectedFontSize: 14,
        currentIndex: selectedPageIndex,
        onTap: selectPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),title: Text("Favorites")),
        ],
      ),
    );
  }
}
