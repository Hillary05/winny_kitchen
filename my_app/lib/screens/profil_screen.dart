import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/models/user_model.dart';
import 'package:my_app/screens/menu_screen.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  //editing controller
  final TextEditingController firstNameEditingController =
      TextEditingController();
  final TextEditingController secondNameEditingController =
      new TextEditingController();
  final TextEditingController emailEditingController =
      new TextEditingController();
  final TextEditingController passwordEditingController =
      new TextEditingController();

  // form key
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot snap) {
      Map<String, dynamic>? map = snap.data() as Map<String, dynamic>?;
      if (map == null) return;
      firstNameEditingController.text = map["firstName"];
      secondNameEditingController.text = map["secondName"];
      emailEditingController.text = map["email"];
      passwordEditingController.text = map["password"];
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // sign up button
    final editButton = Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFFB98068),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            edit();
          }
        },
        child: Text(
          'Edit',
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Profil",
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuPage()));
          },
        ),
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
                        controller: firstNameEditingController,
                        keyboardType: TextInputType.name,
                        // validator
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Firstname cannot be empty');
                          }
                          return null;
                        },
                        onSaved: (value) {},
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Enter your firstName',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 45),
                      TextFormField(
                        autofocus: false,
                        controller: secondNameEditingController,
                        keyboardType: TextInputType.name,
                        // validator
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Second Name cannot be empty');
                          }
                          return null;
                        },
                        onSaved: (value) {},
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Enter your secondName',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 45),
                      TextFormField(
                        autofocus: false,
                        controller: emailEditingController,
                        keyboardType: TextInputType.emailAddress,
                        // validator
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Please enter your email adress');
                          }
                          return null;
                        },
                        onSaved: (value) {},
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Enter your email adress',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 45),
                      editButton,
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void edit() async {
    final _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    String firstName = firstNameEditingController.text;
    String secondName = secondNameEditingController.text;
    String email = emailEditingController.text;

    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    FirebaseFirestore.instance.collection("users").doc(user.uid).update({
      'firstName': firstName,
      'secondName': secondName,
      'email': email,
    });
  }
}
