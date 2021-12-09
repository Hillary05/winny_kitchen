import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:my_app/screens/favoris_screen.dart';
import 'package:my_app/screens/favoris_name_screen.dart';

class LikeButtonWidget extends StatefulWidget {
  final DocumentReference reference;

  const LikeButtonWidget({Key? key, required this.reference}) : super(key: key);
  @override
  _LikeButtonWidgetState createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  @override
  void initState() {
    Future<DocumentSnapshot<Map<String, dynamic>>> futureSnapshots =
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
    futureSnapshots.then((snapshots) {
      List favoris = (snapshots.data())!['favoris'] ?? [];
      if (favoris.contains(widget.reference)) {
        this.isliked = true;
      } else
        this.isliked = false;
      setState(() {});
    });
  super.initState();
  }

  bool isliked = false;
  @override
  Widget build(BuildContext context) {
    final double size = 40;

    return Align(
      alignment: Alignment.bottomLeft,
      child: LikeButton(
        mainAxisAlignment: MainAxisAlignment.end,
        size: size,
        isLiked: isliked,
        likeBuilder: (isliked) {
          final color = isliked ? Colors.red : Colors.grey;
          return Icon(Icons.favorite, color: color, size: size);
        },
        onTap: (isliked) async {
          this.isliked = isliked;
          if (isliked) {
            FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .update({
              'favoris': FieldValue.arrayUnion([widget.reference])
            });
          } else {
            FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .update({
              'favoris': FieldValue.arrayRemove([widget.reference])
            });
          }
          return isliked;
        },
      ),
    );
  }
}
