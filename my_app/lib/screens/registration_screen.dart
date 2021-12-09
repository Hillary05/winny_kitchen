import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/appbar/bottom_navigation_bar.dart';
import 'package:my_app/models/user_model.dart';
//import 'package:my_app/screens/login_page.dart';
import 'package:provider/provider.dart';
import 'package:my_app/controllers/login_controller.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //creating a function loginUI
  loginUI() {
    return Consumer<LoginController>(builder: (context, model, child) {
      //if we are already logged in
      if (model.userDetails != null) {
        return Center(
          child: loggedInUI(model),
        );
      } else {
        return loginControllers(context);
      }
    });
  }

  loggedInUI(LoginController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      //our ui will have three children , name, email, photo, logout button
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.userDetails!.photoURL ?? "").image,
          radius: 50,
        ),

        Text(model.userDetails!.displayName ?? ""),
        Text(model.userDetails!.email ?? ""),

        //logout
        ActionChip(
            avatar: Icon(Icons.logout),
            label: Text("Logout"),
            onPressed: () {
              Provider.of<LoginController>(context, listen: false).logout();
            }),
      ],
    );
  }

  loginControllers(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset(
              "images/new_button.png",
            ),
            onTap: () {
              Provider.of<LoginController>(context, listen: false)
                  .googleLogin();
            },
          ),
        ],
      ),
    );
  }

  //late final FirebaseAuth _auth;
  final _auth = FirebaseAuth.instance;

  // form key
  final _formKey = GlobalKey<FormState>();

  // editing Controller
  final TextEditingController firstNameEditingController =
      new TextEditingController(text: 'sean');
  final TextEditingController secondNameEditingController =
      new TextEditingController(text: 'hillary');
  final TextEditingController emailEditingController =
      new TextEditingController(text: 'kerekouhillary@gmail.com');
  final TextEditingController passwordEditingController =
      new TextEditingController(text: '333333');
  final TextEditingController confirmPasswordEditingController =
      new TextEditingController(text: '333333');

  @override
  Widget build(BuildContext context) {
    // first name field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      // validator
      validator: (value) {
        RegExp regexp = new RegExp(r'.{3,}$');
        if (value!.isEmpty) {
          return ('Firstname cannot be empty');
        }

        if (!regexp.hasMatch(value)) {
          return ("Please enter a valid name(at least three characters)");
        }
        return null;
      },
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Enter your firstName',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        prefixIcon: Icon(
          Icons.account_circle,
          color: Colors.black,
        ),
      ),
    );

    // second name field
    final secondNameField = TextFormField(
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
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        prefixIcon: Icon(
          Icons.account_circle,
          color: Colors.black,
        ),
      ),
    );

    // email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      // validator
      validator: (value) {
        if (value!.isEmpty) {
          return ('Please enter your email adress');
        }

        if (!RegExp("^[a-z0-9](\.?[a-z0-9]){5,}@gmail\.com").hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Enter your email adress',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.black,
        ),
      ),
    );

    // password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      // validator
      validator: (value) {
        RegExp regexp = new RegExp(r'.{6,}$');
        if (value!.isEmpty) {
          return ('Password is required for login');
        }

        if (!regexp.hasMatch(value)) {
          return ("Please enter a valid password(at least six characters");
        }
        return null;
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Enter your password',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Colors.black,
        ),
      ),
    );

    // confirm password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      // validator
      validator: (value) {
        if (confirmPasswordEditingController.text !=
            passwordEditingController.text) {
          return "Password don't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: 'Enter your password',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Colors.black,
        ),
      ),
    );

    // sign up button
    final signUpButton = Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFFB98068),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            signUp(emailEditingController.text, passwordEditingController.text);
          }
        },
        child: Text(
          'SignUp',
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
      backgroundColor: Colors.blueGrey.shade100, //Color(0xFFEDECF2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
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
                    SizedBox(
                      height: 300,
                      child: Image.asset(
                        "images/iimage.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45),
                    firstNameField,
                    SizedBox(height: 45),
                    secondNameField,
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 45),
                    passwordField,
                    SizedBox(height: 45),
                    confirmPasswordField,
                    SizedBox(height: 45),
                    signUpButton,
                    SizedBox(height: 25),
                    loginUI(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //signUp function
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        postDetailsToFirestore();
        Map<String, dynamic> data = {
          'notes': [],
        };
        FirebaseFirestore.instance
            .collection('notes')
            .doc(value.user!.uid)
            .set(data);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Navigation()),
        );
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling your firestore
    //calling your user model
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;
    userModel.password = passwordEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account create successfully :) ");
  }
}
