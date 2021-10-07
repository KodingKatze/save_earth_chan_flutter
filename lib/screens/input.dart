import 'package:flutter/material.dart';
import 'package:save_earth_chan_flutter/customs/judul.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  String title = '';
  String desc = '';
  String loc = '';
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Judul(title: "Input",),
        
      ],),
    );
  }
}
