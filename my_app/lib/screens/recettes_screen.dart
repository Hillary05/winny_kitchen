import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/screens/edit_receipt.dart';
import 'add_receipt.dart';

class RecettesPage extends StatefulWidget {
  RecettesPage();

  @override
  _RecettesPageState createState() => _RecettesPageState();
}

class _RecettesPageState extends State<RecettesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Add your own receipt",
          textAlign: TextAlign.center,
          style: GoogleFonts.raleway(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            //fontStyle: FontStyle.italic,
          ),
        ),
        elevation: 0,
        leading: null,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNote()));
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('notes')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshots) {
            if (!snapshots.hasData || snapshots.data == null || snapshots.data!.data() == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List? list = snapshots.data!.data()!['notes'];
            if (list == null) return Container();
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: ListTile(
                    title: Text(list[index]['title']),
                    onTap: () {
                      showDetails(list[index], list);
                    },
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }

  void showDetails(Map<String, dynamic> recipe, List list) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditReceipt(recipe: recipe, recipes: list)));
  }
}
