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

    return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: NetworkImage(disaster!.picture[0]),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(disaster!.eventTitle, style: GoogleFonts.poppins(textStyle: _styleAtas)),
              Text(disaster!.description, style: GoogleFonts.poppins(textStyle: _styleBawah))
            ],
          )
        );
  }
}