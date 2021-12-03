import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_receipt.dart';

class EditReceipt extends StatefulWidget {
  final Map<String, dynamic> recipe;

  final List recipes;

  const EditReceipt({Key? key, required this.recipe, required this.recipes}) : super(key: key);
  @override
  _EditReceiptState createState() => _EditReceiptState();
}

class _EditReceiptState extends State<EditReceipt> {
  // editing Controller
  final TextEditingController titleEditingController =
      new TextEditingController();
  final TextEditingController ingredientsEditingController =
      new TextEditingController();
  final TextEditingController receiptEditingController =
      new TextEditingController();

  // form key
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    titleEditingController.text = widget.recipe['title'];
    ingredientsEditingController.text = widget.recipe['ingredients'];
    receiptEditingController.text = widget.recipe['receipt'];
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleEditingController.dispose();
    super.dispose();
  }

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
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                update();
                Navigator.pop(context);
              }
            },
            child: Text('Save'),
          )
        ],
      ),
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
                    expands: false,
                    // validator
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('name cannot be empty');
                      }
                      return null;
                    },
                    onSaved: (value) {},
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(      
                        borderSide: BorderSide.none,   
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    autofocus: false,
                    controller: ingredientsEditingController,
                    keyboardType: TextInputType.name,
                    expands: false,
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
                        enabledBorder: UnderlineInputBorder(      
                          borderSide: BorderSide.none,   
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    autofocus: false,
                    controller: receiptEditingController,
                    keyboardType: TextInputType.name,
                    expands: false,
                    // validator
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('receipt cannot be empty');
                      }
                      return null;
                    },
                    onSaved: (value) {},
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(      
                          borderSide: BorderSide.none,   
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  void update() {
    final _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    String title = titleEditingController.text;
    String ingredients = ingredientsEditingController.text;
    String receipt = receiptEditingController.text;
    int indexOldElem = widget.recipes.indexOf(widget.recipe); 
    

    List updatedList = widget.recipes;
    updatedList[indexOldElem] = {
      'title': title,
      'ingredients': ingredients,
      'receipt': receipt,
    };
    Map<String, dynamic> updatedData = {
      'notes': updatedList,
    };

    FirebaseFirestore.instance
        .collection('notes')
        .doc(user!.uid)
        .update(updatedData);
  }
}
