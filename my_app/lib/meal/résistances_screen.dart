import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/meal/entr%C3%A9es_screen.dart';
import 'package:my_app/models/user_receipt.dart';

class ResistancesPage extends StatefulWidget {
  @override
  _ResistancesPageState createState() => _ResistancesPageState();
}

class _ResistancesPageState extends State<ResistancesPage> {
  @override
  Widget build(BuildContext context) {
    //double? defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Résistances",
          textAlign: TextAlign.center,
          style: GoogleFonts.raleway(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 16,
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
                    .where('type', isEqualTo: 'résistance')
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
                        crossAxisCount: 3,
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
