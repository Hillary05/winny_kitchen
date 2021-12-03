import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/appbar/bottom_navigation_bar.dart';

class FavorisPage extends StatefulWidget {
  @override
  _FavorisPageState createState() => _FavorisPageState();
}

class _FavorisPageState extends State<FavorisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Your favorite recipes",
          textAlign: TextAlign.center,
          style: GoogleFonts.raleway(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            //fontStyle: FontStyle.italic,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Navigation()));
          },
        ),
      ),
    );
  }
}