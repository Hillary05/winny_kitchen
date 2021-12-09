import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/models/user_receipt.dart';
import 'package:my_app/receipts/Allreceipts_screen.dart';

class RecipesPage extends StatefulWidget {
  final String category;

  const RecipesPage({Key? key, required this.category}) : super(key: key);
  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  Widget build(BuildContext context) {
    //double? defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.category.toUpperCase()[0] + widget.category.substring(1) + 's',
          textAlign: TextAlign.center,
          style: GoogleFonts.raleway(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 24,
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
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('recettes')
                .where('type', isEqualTo: widget.category)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshots) {
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
                    childAspectRatio: (.65),
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RecipeItem(recipe: list[index]);
                  });
            },
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

class RecipeItem extends StatelessWidget {
  final ModelRecipe recipe;
  final bool canLike;

  const RecipeItem({Key? key, required this.recipe, this.canLike = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AllReceipt(recipe: recipe, canLike: canLike)));
      },
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.deepOrangeAccent,
                Colors.deepOrangeAccent,
                Colors.red,
                Colors.red,
              ], // red to yellow
              tileMode: TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                recipe.imageUrl,
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitWidth,
              ),
              Text(
                recipe.title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
