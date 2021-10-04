import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Judul extends StatelessWidget {
  Judul({this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    final _styleAtas = TextStyle(
        fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black);
    final _styleBawah = TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF00A1B8));

    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${this.title}",
              style: GoogleFonts.poppins(textStyle: _styleBawah),
            )
          ],
        ),
      ],
    ));
  }
}