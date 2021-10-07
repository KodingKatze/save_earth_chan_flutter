import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:save_earth_chan_flutter/customs/image_view.dart';
import 'package:save_earth_chan_flutter/customs/judul.dart';
import 'package:save_earth_chan_flutter/services/database.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseHandler database = new DatabaseHandler();
  String search = '';
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _data = database.fetchAll();
    return Column(children: [
      Judul(
        title: "Explore",
      ),
      AnimSearchBar(
      width: 400.0 / MediaQuery.of(context).devicePixelRatio, 
      textController: textController, 
      onSuffixTap: (){
        setState(() {
          textController.clear();
        });
      }),
      FutureBuilder(
          future: database.fetchAll(),
          builder: (context, AsyncSnapshot<List<Disaster>> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
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
                              600.0 / MediaQuery.of(context).devicePixelRatio))
                ],
              );
            } else {
              return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator());
            }
          }),
      Judul(
        title: "List of disaster",
      ),
    ]);
  }
}
