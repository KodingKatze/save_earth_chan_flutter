import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_earth_chan_flutter/screens/home.dart';
import 'package:save_earth_chan_flutter/screens/input.dart';
import 'package:save_earth_chan_flutter/screens/nearyou.dart';

class Indexer extends StatefulWidget {
  @override
  _IndexerState createState() => _IndexerState();
}

class _IndexerState extends State<Indexer> {
  var _currentPage = 1;
  dynamic _widget = [NearYou(), Home(), Input()];
  
      List<TabItem> tabItems = List.of([
    new TabItem(Icons.near_me, "Near Me", Colors.green,
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    new TabItem(Icons.home, "Home", Colors.green,
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    new TabItem(Icons.input, "Add", Colors.green,
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(_currentPage);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 20.0),
          child: _widget[_currentPage]),
        bottomNavigationBar: CircularBottomNavigation(
          tabItems,
          controller: _navigationController,
          selectedCallback: (int selectedPos) {
            setState(() {
              _currentPage = selectedPos;
            });
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
