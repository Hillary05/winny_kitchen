import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/models/user_receipt.dart';
import 'package:my_app/widget/like_button_widget.dart';

class AllReceipt extends StatefulWidget {
  final ModelRecipe recipe;
  final bool canLike;

  const AllReceipt({Key? key, required this.recipe, required this.canLike})
      : super(key: key);

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
          "Recette",
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
                    fontFamily: 'RobotoMono',
                    color: Colors.blueGrey.shade200,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.receipt_long_rounded, color: Colors.orange.shade800),
                SizedBox(width: 10),
                Text(
                  "Ingr??dients",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ]),
              SizedBox(height: 30),
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
              SizedBox(height: 40,),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.receipt_long_rounded, color: Colors.orange.shade800),
                SizedBox(width: 10),
                Text(
                  "La recette",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ]),
              SizedBox(height: 30,),
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
              SizedBox(height: 20,),
              if (widget.canLike)
                LikeButtonWidget(
                  reference: widget.recipe.reference,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
