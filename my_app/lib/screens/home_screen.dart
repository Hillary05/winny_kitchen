import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/meal/entrées_screen.dart';
import 'package:my_app/meal/résistances_screen.dart';
import 'package:my_app/meal/desserts_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      /*appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),*/
      body: SingleChildScrollView(
        child: Container(
         margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ), 
          child: Column(
            children: [
             /* SizedBox(
                height: 300,
              child: Image.asset(
                "images/iiimage.png",
                fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),*/
              Text('Welcome to the\nculinary world',
              textAlign: TextAlign.center,
              style: GoogleFonts.pacifico(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 50,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text('Choose a type of meal to make',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                //fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EntreesPage()));
                },
                child: Container(
                  height: 150.0,
                  width: 375.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    image: DecorationImage(image: AssetImage("images/entrés_2.png"), fit: BoxFit.cover),
                    color: Colors.black38,
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
                      child: Text("Entrées",
                      style: TextStyle (
                        fontSize: 20.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResistancesPage()));
                },
                child: Container(
                  height: 150.0,
                  width: 375.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    image: DecorationImage(image: AssetImage("images/résistance.png"), fit: BoxFit.cover),
                    color: Colors.black38,
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
                      child: Text("Résistances",
                      style: TextStyle (
                        fontSize: 20.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DessertsPage()));
                },
                child: Container(
                  height: 150.0,
                  width: 380.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    image: DecorationImage(image: AssetImage("images/desserts.png"), fit: BoxFit.cover),
                    color: Colors.black38,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade50,
                        blurRadius: 10.0,
                        offset: Offset(0.0,10.0),
                        )
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Desserts",
                      style: TextStyle (
                        fontSize: 20.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}