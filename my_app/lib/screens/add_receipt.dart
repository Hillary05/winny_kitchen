import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
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
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleEditingController.dispose();
    ingredientsEditingController.dispose();
    receiptEditingController.dispose();
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
                save();
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
                    maxLines: 2,
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
                      labelText: 'Enter a name',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    autofocus: false,
                    controller: ingredientsEditingController,
                    keyboardType: TextInputType.name,
                    maxLines: 20,
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
                      labelText: 'Enter a ingredients',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      focusColor: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    autofocus: false,
                    controller: receiptEditingController,
                    keyboardType: TextInputType.name,
                    maxLines: 20,
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
                      labelText: 'Enter your receipt',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
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

  void save() {
    final _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    String title = titleEditingController.text;
    String ingredients = ingredientsEditingController.text;
    String receipt = receiptEditingController.text;

    Map<String, dynamic> data = {
      'notes': FieldValue.arrayUnion([
        {
          'title': title,
          'ingredients': ingredients,
          'receipt': receipt,
        }
      ]),
    };
    print(user!.uid);
    FirebaseFirestore.instance.collection('notes').doc(user.uid).update(data);
  }
}
