import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/meal/entr%C3%A9es_screen.dart';
import 'package:my_app/models/user_receipt.dart';

class DessertsPage extends StatefulWidget {
  @override
  _DessertsPageState createState() => _DessertsPageState();
}

class _DessertsPageState extends State<DessertsPage> {
  @override
  Widget build(BuildContext context) {
    //double? defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Desserts",
          textAlign: TextAlign.center,
          style: GoogleFonts.raleway(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 12,
            fontWeight: FontWeight.w700,
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
          child: Column(
            children: [
              ClipPath(
                clipper: CustomShape(),
                child: Container(
                  width: 600,
                  height: 300,
                  decoration: BoxDecoration(
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
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('recettes')
                    .where('type', isEqualTo: 'dessert')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshots) {
                  if (!snapshots.hasData || snapshots.data == null)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  //print(snapshots.data!.docs);
                  List<ModelRecipe> list =
                      List.generate(snapshots.data!.docs.length, (index) {
                    QueryDocumentSnapshot<Map<String, dynamic>> doc =
                        snapshots.data!.docs[index];
                    return ModelRecipe.fromQueryDocumentSnapshot(doc);
                  });
                  return GridView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (.75),
                      ),
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RecipeItem(recipe: list[index]);
                      });
                },
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
