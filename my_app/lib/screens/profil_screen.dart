import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/screens/menu_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {

  //editing controller
  final TextEditingController firstNameEditingController =  TextEditingController();
  final TextEditingController secondNameEditingController = new TextEditingController();
  final TextEditingController emailEditingController = new TextEditingController();
  final TextEditingController passwordEditingController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    FirebaseFirestore.instance
    .collection("users")
    .doc(user!.uid)
    .get()
    .then((DocumentSnapshot snap){
      Map<String, dynamic>? map = snap.data() as Map<String, dynamic>?;
      if (map == null) return;
      firstNameEditingController.text = map["firstName"];
      secondNameEditingController.text = map["secondName"];
      emailEditingController.text = map["email"];
      passwordEditingController.text = map["password"];
      setState((){});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  // form key
  final _formKey = GlobalKey<FormState>();

  //first name field
  final  firstNameField = TextFormField(
    autofocus: false,
    controller: firstNameEditingController,
    keyboardType: TextInputType.name,
    //validator
    validator: (value) {
      RegExp regexp = new RegExp(r'.{3,}$');
      if (value!.isEmpty) {
        return ('Firstname cannot be empty');
      }

      if(!regexp.hasMatch(value)) {
        return("Please enter a valid name(at least three characters)");
      }
      return null;
    }, // form key

    onSaved: (value) {
      firstNameEditingController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      labelText: 'Enter your firstName',
      border: InputBorder.none,
      prefixIcon: Icon(
        Icons.account_circle,
        color: Colors.black,
      ),
    ),
  );

  // second name field
  final  secondNameField = TextFormField(
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
    onSaved: (value) {
      secondNameEditingController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      labelText: 'Enter your secondName',
      border: InputBorder.none,
      prefixIcon: Icon(
        Icons.account_circle,
        color: Colors.black,
      ),
    ),
  );

  // email field
  final  emailField = TextFormField(
    autofocus: false,
    controller: emailEditingController,
    keyboardType: TextInputType.emailAddress,
    // validator
    validator: (value) {
      if (value!.isEmpty) {
        return ('Please enter your email adress');
      }

      if(!RegExp("^[a-z0-9](\.?[a-z0-9]){5,}@gmail\.com")
        .hasMatch(value)) {
        return("Please enter a valid email");
      }
      return null;
    },
    onSaved: (value) {
      emailEditingController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
    labelText: 'Enter your email adress',
    border: InputBorder.none,
    prefixIcon: Icon(
      Icons.mail,
      color: Colors.black,
      ),
    ),
  );

  // password field
  final  passwordField = TextFormField(
    autofocus: false,
    controller: passwordEditingController,
    obscureText: true,
    // validator
    validator: (value) {
      RegExp regexp = new RegExp(r'.{6,}$');
      if (value!.isEmpty) {
        return ('Password is required for login');
      }
      if(!regexp.hasMatch(value)) {
        return("Please enter a valid password(at least six characters");
      }
      return null;
    },
    onSaved: (value) {
      passwordEditingController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      labelText: 'Enter your password',
      border: InputBorder.none,
      prefixIcon: Icon(
        Icons.vpn_key,
        color: Colors.black,
      ),
    ),
  );

  // sign up button
  final submitButton = Material(
    elevation: 0,
    borderRadius: BorderRadius.circular(30),
    color: Color(0xFFB98068),
    child: MaterialButton(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      minWidth: MediaQuery.of(context).size.width,
      onPressed: () {
      },
      child: Text(
        'Submit',
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
      appBar:AppBar(
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
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => MenuPage()));
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
                    firstNameField,
                    SizedBox(height: 45),
                    secondNameField,
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 45),
                    passwordField,
                    SizedBox(height: 45),
                    submitButton,
                  ]
               ),
              ),
            ),
          ),
        ),
      ),
    );  
  }

  void UpdateUser(String email, String password) async {
    User? user = _auth.currentUser;
    FirebaseFirestore.instance.collection('users').doc().set({
      'email': email,
      'password': password,
    });
  }

}

