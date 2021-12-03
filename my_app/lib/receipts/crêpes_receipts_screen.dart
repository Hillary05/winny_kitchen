import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/meal/entrées_screen.dart';
import 'package:my_app/widget/like_button_widget.dart';

class CrepesReceipt extends StatefulWidget {
  @override
  _CrepesReceiptState createState() => _CrepesReceiptState();
}

class _CrepesReceiptState extends State<CrepesReceipt> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Crêpes Farcies",
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
              MaterialPageRoute(builder: (context) => EntreesPage()));*/
          },
        ),
      ),
      body: SingleChildScrollView(
         child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Recette de crêpes farcies",
                  style: TextStyle (
                    fontSize: 25.0,
                    fontFamily: 'Raleway',
                    color: Colors.blueGrey.shade500,
                  ),
                ),
              ),
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('images/ingredients_two.png',
                    width: 30.0,
                    height: 30.0,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Ingrédients pour 10 personnes",
                    style: TextStyle (
                    fontSize: 17.0,
                    fontFamily: 'Raleway',
                    color: Colors.black87,
                    ),
                  ),
                ]
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "200g de farine\nun demi litre de lait\n2 cuillères à soupe d'huile\n2 oeufs\n1 sachet de levure chimique\nune pincée de sel",
                  style: TextStyle (
                    fontSize: 16.0,
                    fontFamily: 'Raleway',
                    color: Colors.grey,
                  ),
                ),
              ),
              /*SizedBox(
                height: height,
                child: LikeButtonWidget(),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}