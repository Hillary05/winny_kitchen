import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/models/user_receipt.dart';
import 'package:my_app/widget/like_button_widget.dart';

class AllReceipt extends StatefulWidget {
  final ModelRecipe recipe;
  const AllReceipt({Key? key, required this.recipe}) : super(key: key);
  @override
  _AllReceiptState createState() => _AllReceiptState();
}

class _AllReceiptState extends State<AllReceipt> {
  bool isliked = false;

  @override
  Widget build(BuildContext context) {
   // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar: AppBar(
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
                  widget.recipe.title,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Raleway',
                    color: Colors.blueGrey.shade500,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Image.asset(
                  'images/ingredients_two.png',
                  width: 30.0,
                  height: 30.0,
                ),
                SizedBox(width: 10),
                Text(
                  "Ingrédients",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontFamily: 'Raleway',
                    color: Colors.black87,
                  ),
                ),
              ]),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.recipe.ingredients,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Raleway',
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "La recette",
                style: TextStyle(
                  fontSize: 17.0,
                  fontFamily: 'Raleway',
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.recipe.recipe,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Raleway',
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LikeButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
