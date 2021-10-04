import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_earth_chan_flutter/services/auth.dart';
import 'package:save_earth_chan_flutter/screens/home.dart';
import 'package:save_earth_chan_flutter/screens/wrapper.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return MaterialApp(
      home: Container(
        child: Indexer(),
      ),
    );
  }
}