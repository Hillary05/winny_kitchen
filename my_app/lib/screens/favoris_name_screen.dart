import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Favorisname extends StatefulWidget {
  @override
  _FavorisnameState createState() => _FavorisnameState();
}

class _FavorisnameState extends State<Favorisname> {

  // editing Controller
  final TextEditingController nameEditingController =
      new TextEditingController();

  // form key
  final _formKey = GlobalKey<FormState>();

Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Name",
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
                    controller: nameEditingController,
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
                      labelText: 'Enter a name',
                      enabledBorder: UnderlineInputBorder(      
                        borderSide: BorderSide.none,   
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

  void save() {
    final _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    String name = nameEditingController.text;

    Map<String, dynamic> data = {
      'FavorisName': FieldValue.arrayUnion([
        {
          'name': name,
        }
      ]),
    };
    FirebaseFirestore.instance.collection('FavorisName').doc(user!.uid).update(data);
  }
}
