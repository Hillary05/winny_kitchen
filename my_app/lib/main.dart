import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/appbar/bottom_navigation_bar.dart';
import 'package:my_app/controllers/login_controller.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app/screens/onboard_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


int? isviewed;

Future<void> main() async{
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  await Firebase.initializeApp();
  runApp(MyFirstPage());
}

class MyFirstPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  StreamSubscription<User?>? subscription;
  bool? loggedIn;

  @override
  void initState() {
   subscription = FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      loggedIn = false;
      print('User is currently signed out!');
    } else {
      loggedIn = true;
      print('User is signed in!');
    }
    setState(() {
    });
  });
    super.initState();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
      ],
      child: MaterialApp(
        theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF000000)),
        title: 'my_app',
        debugShowCheckedModeBanner: false,
       home: isviewed != 0 ? OnBoard() : redirect(),
             ),
           );
         }
       
         redirect() {
           switch (loggedIn) {
             case true:
              return Navigation();
             case false:
              return LoginScreen();
             default:
              return Scaffold(backgroundColor: Colors.white, body: Center(child: CircularProgressIndicator()));
           }
         }
}
