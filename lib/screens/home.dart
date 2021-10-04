import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:save_earth_chan_flutter/customs/judul.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Judul(title: "Home",),
        CarouselSlider(
  options: CarouselOptions(height: 400.0 / MediaQuery.of(context).devicePixelRatio),
  items: [1,2,3,4,5].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.amber
          ),
          child: Text('text $i', style: TextStyle(fontSize: 16.0),)
        );
      },
    );
  }).toList(),
),
      ],)
    );
  }
}