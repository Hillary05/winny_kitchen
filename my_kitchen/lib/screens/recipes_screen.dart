import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipesPage extends StatefulWidget {
  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
   // editing Controller
  final TextEditingController titleEditingController =
      new TextEditingController();
  final TextEditingController ingredientsEditingController =
      new TextEditingController();
  final TextEditingController recipeEditingController =
      new TextEditingController();
   final TextEditingController typeEditingController =
      new TextEditingController();

  // form key
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleEditingController.dispose();
    ingredientsEditingController.dispose();
    recipeEditingController.dispose();
    typeEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final sendButton = Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFFB98068),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          retrieveInformationandSave();
        },
        child: Text(
          'Send',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

     return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      /*appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Recipe add",
          textAlign: TextAlign.center,
          style: GoogleFonts.raleway(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            //fontStyle: FontStyle.italic,
          ),
        ),
      ),*/
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    autofocus: false,
                    controller: titleEditingController,
                    keyboardType: TextInputType.name,
                    // validator
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('title cannot be empty');
                      }
                      return null;
                    },
                    onSaved: (value) {},
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(
                        borderRadius:
                          BorderRadius.all(Radius.circular(20.0))),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    autofocus: false,
                    controller: ingredientsEditingController,
                    keyboardType: TextInputType.name,
                    // validator
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('ingredients cannot be empty');
                      }
                      return null;
                    },
                    onSaved: (value) {},
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'ingredients',
                      border: OutlineInputBorder(
                        borderRadius:
                          BorderRadius.all(Radius.circular(20.0))),
                      focusColor: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    autofocus: false,
                    controller: recipeEditingController,
                    keyboardType: TextInputType.name,
                    // validator
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('recipe cannot be empty');
                      }
                      return null;
                    },
                    onSaved: (value) {},
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'recipe',
                      border: OutlineInputBorder(
                        borderRadius:
                          BorderRadius.all(Radius.circular(20.0))),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    autofocus: false,
                    controller: typeEditingController,
                    keyboardType: TextInputType.name,
                    // validator
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('type cannot be empty');
                      }
                      return null;
                    },
                    onSaved: (value) {},
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'category',
                      border: OutlineInputBorder(
                        borderRadius:
                          BorderRadius.all(Radius.circular(20.0))),
                    ),
                  ),
                  SizedBox(height: 30),
                  sendButton,
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  void retrieveInformationandSave() {
    String title = titleEditingController.text;
    String ingredients = ingredientsEditingController.text;
    String recipe = recipeEditingController.text;
    String type = typeEditingController.text;

    Map<String, dynamic> map = {
      'title':  title,
      'ingredients':  ingredients,
      'recipe':  recipe,
      'type':  type,
    };
    FirebaseFirestore.instance.collection('recettes').doc().set(map)
    .then((value) {
      titleEditingController.clear();
      ingredientsEditingController.clear();
      recipeEditingController.clear();
      typeEditingController.clear();
    });
  }
}