import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
 @override
  Widget build(BuildContext context) {

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFFB98068),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LoginScreen()));
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

    final registerButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => RegistrationScreen()));
        },
        child: Text(
          'Register',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFFB98068),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,//Color(0xFFEDECF2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
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
                  SizedBox(height: 45),
                  Text(
                    "Discover simple and\neasy-to-make recipes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF8C746A),
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins"
                    ),
                  ),
                  SizedBox(height:45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: loginButton),
                      SizedBox(width:30),
                      Expanded(child: registerButton),
                    ],
                  ),
                  SizedBox(height: 45),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}