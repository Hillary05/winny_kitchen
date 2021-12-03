import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/appbar/bottom_navigation_bar.dart';
import 'package:my_app/models/user_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // form key
  final _formkey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    
    // email field
    final  emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      // validator
      validator: (value) {
        if (value!.isEmpty) {
          return ('Please enter your email adress');
        }

        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
          .hasMatch(value)) {
            return("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Enter your email adress',
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.black,
        ),
      ),
    );

    // password field
     final  passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
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
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
       decoration: InputDecoration(
        labelText: 'Enter your password',
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Colors.black,
        ),
      ),
    );

    // login button
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFFB98068),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signIn(emailController.text, passwordController.text);
          /*if (_formkey.currentState!.validate()) {
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Navigation()));
          }*/
        },
        child: Text(
          'Login',
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
      backgroundColor: Colors.blueGrey.shade100,//Color(0xFFEDECF2),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      child: Image.asset(
                        "images/iiimage.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 50),
                    emailField,
                    SizedBox(height: 45),
                    passwordField,
                    SizedBox(height: 45),
                    loginButton,
                    SizedBox(height: 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  RegistrationScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //login function
  void signIn(String email, String password) async
  {
  if (_formkey.currentState!.validate()) {
    await _auth.signInWithEmailAndPassword(email: email, password: password)
      .then((uid) {
        Fluttertoast.showToast(msg: "Login Successful");
         Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Navigation()));
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

}

