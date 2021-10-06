import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_earth_chan_flutter/services/database.dart';

class pictureShowItem extends StatelessWidget {
  pictureShowItem({this.disaster});
  final Disaster? disaster;

  @override
  Widget build(BuildContext context) {
    final _styleAtas = TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
    final _styleBawah = TextStyle(
        fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black);

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

    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(disaster!.picture.first),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Column(
          children: [
            Text(disaster!.eventTitle,
                style: GoogleFonts.poppins(textStyle: _styleAtas)),
            Text(disaster!.description,
                style: GoogleFonts.poppins(textStyle: _styleBawah))
          ],
        ));
  }
}
