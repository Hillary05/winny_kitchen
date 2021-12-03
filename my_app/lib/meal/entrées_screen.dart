import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/appbar/bottom_navigation_bar.dart';
import 'package:my_app/receipts/crêpes_receipts_screen.dart';

class EntreesPage extends StatefulWidget {
  @override
  _EntreesPageState createState() => _EntreesPageState();
}

class _EntreesPageState extends State<EntreesPage> {
  @override
  Widget build(BuildContext context) {
    //double? defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Entrées",
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
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.all(Radius.circular(300.0)),
                    image: DecorationImage(
                        image: AssetImage("images/first_meal.png"),
                        fit: BoxFit.cover),
                    color: Colors.black38,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              recipeItem(),
            ],
          ),
        ),
      ),
    );
  }

  Widget recipeItem() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CrepesReceipt()));
          },
          child: Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(300.0)),
              image: DecorationImage(
                  image: AssetImage("images/crêpes.png"), fit: BoxFit.cover),
              color: Colors.black38,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 5.0),
                )
              ],
            ),
          ),
        ),
        Text(
          "Crêpes\nfarcies",
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Raleway',
            color: Colors.black87,
          ),
        ),
      ],
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
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
