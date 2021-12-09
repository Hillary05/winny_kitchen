import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/appbar/bottom_navigation_bar.dart';
import 'package:my_app/screens/first_page.dart';
import 'package:my_app/screens/profil_screen.dart';
import 'package:my_app/size_config.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double? defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Menu",
          textAlign: TextAlign.center,
          style: GoogleFonts.raleway(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            //fontStyle: FontStyle.italic,
          ),
        ),
        elevation: 0,
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Navigation()));
          },
        ),*/
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ClipPath(
                clipper: CustomShape(),
                child: Container(
                  width: 600,
                  height: 400,
                  color: Colors.blue.shade700,
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      image: DecorationImage(
                          image: AssetImage("images/icone.png"),
                          fit: BoxFit.cover),
                      color: Colors.black12,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilPage()));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultSize! + 2, vertical: defaultSize + 3),
                  child: Row(children: [
                    Image.asset(
                      'images/My_account.png',
                      width: 20.0,
                      height: 20.0,
                    ),
                    SizedBox(width: defaultSize * 2),
                    Text(
                      'My account',
                      style: TextStyle(
                        fontSize: defaultSize * 1.6,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: defaultSize * 1.6,
                      color: Colors.black87,
                    ),
                  ]),
                ),
              ),
              // InkWell(
              //   onTap: () {},
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(
              //         horizontal: defaultSize + 2, vertical: defaultSize + 3),
              //     child: Row(children: [
              //       Image.asset(
              //         'images/settings.png',
              //         width: 20.0,
              //         height: 20.0,
              //       ),
              //       SizedBox(width: defaultSize * 2),
              //       Text(
              //         'Settings',
              //         style: TextStyle(
              //           fontSize: defaultSize * 1.6,
              //           color: Colors.blueGrey,
              //         ),
              //       ),
              //       Spacer(),
              //       Icon(
              //         Icons.arrow_forward_ios,
              //         size: defaultSize * 1.6,
              //         color: Colors.black87,
              //       ),
              //     ]),
              //   ),
              // ),
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut().then((value) => {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => AuthPage()))
                      });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultSize + 2, vertical: defaultSize + 3),
                  child: Row(children: [
                    Image.asset(
                      'images/log_out.png',
                      width: 20.0,
                      height: 20.0,
                    ),
                    SizedBox(width: defaultSize * 2),
                    Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: defaultSize * 1.6,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: defaultSize * 1.6,
                      color: Colors.black87,
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
