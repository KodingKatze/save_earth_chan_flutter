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
    new TabItem(Icons.home, "Home", Colors.blue,
        labelStyle: TextStyle(fontWeight: FontWeight.normal)),
    new TabItem(Icons.search, "Search", Colors.orange,
        labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    new TabItem(Icons.layers, "Reports", Colors.red),
    new TabItem(Icons.notifications, "Notifications", Colors.cyan),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widget[_currentPage],
        bottomNavigationBar: CircularBottomNavigation(
          tabItems,
          selectedCallback: (int selectedPos) {
            _currentPage = selectedPos;
          },
        ));
  }
}
