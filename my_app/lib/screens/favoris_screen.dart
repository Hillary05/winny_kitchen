import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/meal/entr%C3%A9es_screen.dart';
import 'package:my_app/models/user_receipt.dart';

class FavorisPage extends StatefulWidget {
  @override
  _FavorisPageState createState() => _FavorisPageState();
}

class _FavorisPageState extends State<FavorisPage> {
  final List<ModelRecipe> recipes = [];

  @override
  void initState() {
    Future<DocumentSnapshot<Map<String, dynamic>>> futureSnapshots =
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
    futureSnapshots.then((snapshots) async {
      List favorisList = (snapshots.data())!['favoris'] ?? [];
      for (DocumentReference reference in favorisList) {
        DocumentSnapshot snapshot = await reference.get();
        ModelRecipe recipe = ModelRecipe.fromQueryDocumentSnapshot(snapshot);
        recipes.add(recipe);
        setState(() {});
        print(recipe.title);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Your favorite recipes",
          textAlign: TextAlign.center,
          style: GoogleFonts.raleway(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),*/
      ),
      body: SingleChildScrollView(
        child: Container(
          child: GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (.65),
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: recipes.length,
              itemBuilder: (BuildContext context, int index) {
                return RecipeItem(recipe: recipes[index]);
              }),
        ),
      ),
    );
  }
}
