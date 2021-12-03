import 'package:flutter/material.dart';
import 'screens/recipes_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() {
  runApp(MyKitchen());
}

class MyKitchen extends StatefulWidget {
  
  @override
  _MyKitchenState createState() => _MyKitchenState();
}

class _MyKitchenState extends State<MyKitchen> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kitchen app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error!);
        }
        else if (snapshot.connectionState == ConnectionState.done) {
          return RecipesPage();
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return const Scaffold (backgroundColor: Colors.grey, body: Center(child: CircularProgressIndicator(),));
        },
      ),
    );
  }
}
