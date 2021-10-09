import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:save_earth_chan_flutter/services/database.dart';

class CardDisasterView extends StatelessWidget {
  CardDisasterView({this.disaster});
  final Disaster? disaster;
  

  @override
  Widget build(BuildContext context) {

    if (disaster!.picture == null) {
      disaster!.picture = [
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png"
      ];
    }
    if (disaster!.eventTitle == null) {
      disaster!.eventTitle = "No Title";
    }
    if (disaster!.description == null) {
      disaster!.description = "No Description";
    }
    
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
        imageUrl: disaster!.picture[0],
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),),
              Column(
                children: [
                  Text(disaster!.eventTitle),
                  Text(disaster!.description)
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            ],
          )
        ],
      ),
    );
  }
}
