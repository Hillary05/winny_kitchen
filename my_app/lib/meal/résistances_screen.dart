import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/appbar/bottom_navigation_bar.dart';

class ResistancesPage extends StatefulWidget {
  @override
  _ResistancesPageState createState() => _ResistancesPageState();
}

class _ResistancesPageState extends State<ResistancesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFFEDECF2),
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Résistances",
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
            Navigator.pop(context);
            /*Navigator.push(context,
              MaterialPageRoute(builder: (context) => Navigation()));*/
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          /*margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),*/
          child: Column(
            children: [
              ClipPath(
                clipper: CustomShape(),
                child: Container(
                  width: 600,
                  height: 300,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(300.0)),
                      color: Colors.black12,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          offset: Offset(0.0,10.0),
                        )
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("one",
                      style: TextStyle (
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(300.0)),
                    color: Colors.black12,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        offset: Offset(0.0,10.0),
                      )
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("two",
                    style: TextStyle (
                      fontSize: 16.0,
                      fontFamily: 'Raleway',
                      color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(300.0)),
                    color: Colors.black12,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        offset: Offset(0.0,10.0),
                      )
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("three",
                    style: TextStyle (
                      fontSize: 16.0,
                      fontFamily: 'Raleway',
                      color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
              SizedBox(
                height: 30,
              ),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(300.0)),
                      color: Colors.black12,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          offset: Offset(0.0,10.0),
                        )
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("four",
                      style: TextStyle (
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(300.0)),
                    color: Colors.black12,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        offset: Offset(0.0,10.0),
                      )
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("five",
                    style: TextStyle (
                      fontSize: 16.0,
                      fontFamily: 'Raleway',
                      color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(300.0)),
                    color: Colors.black12,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        offset: Offset(0.0,10.0),
                      )
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("six",
                    style: TextStyle (
                      fontSize: 16.0,
                      fontFamily: 'Raleway',
                      color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
              ),
              SizedBox(
                height: 30,
              ),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(300.0)),
                      color: Colors.black12,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          offset: Offset(0.0,10.0),
                        )
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("seven",
                      style: TextStyle (
                        fontSize: 16.0,
                        fontFamily: 'Raleway',
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(300.0)),
                    color: Colors.black12,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        offset: Offset(0.0,10.0),
                      )
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("eight",
                    style: TextStyle (
                      fontSize: 16.0,
                      fontFamily: 'Raleway',
                      color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(300.0)),
                    color: Colors.black12,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        offset: Offset(0.0,10.0),
                      )
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("nine",
                    style: TextStyle (
                      fontSize: 16.0,
                      fontFamily: 'Raleway',
                      color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override 
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width/2, height, width, height-100);
    path.lineTo(width, 0);
    path.close();
    return path;

  }
  @override 

  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}