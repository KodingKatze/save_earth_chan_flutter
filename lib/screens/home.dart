import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:save_earth_chan_flutter/customs/image_view.dart';
import 'package:save_earth_chan_flutter/customs/judul.dart';
import 'package:save_earth_chan_flutter/services/database.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseHandler database = new DatabaseHandler();

  @override
  Widget build(BuildContext context) {
    final _data = database.fetchAll();
    return FutureBuilder(
        future: database.fetchAll(),
        builder: (context, AsyncSnapshot<List<Disaster>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Judul(
                  title: "Home",
                ),
                CarouselSlider(
                    items: snapshot.data!.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return pictureShowItem(disaster: i);
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                        height:
                            400.0 / MediaQuery.of(context).devicePixelRatio))
              ],
            );
          } else {
            return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          }
        });
  }
}
