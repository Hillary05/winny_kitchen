import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeButtonWidget extends StatefulWidget {
  @override
  _LikeButtonWidgetState createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  bool isliked = false;
  int likeCount = 0;
  @override
  Widget build(BuildContext context) {
    final double size = 40;

    return LikeButton(
      mainAxisAlignment: MainAxisAlignment.end,
      size: size,
      isLiked: isliked,
      likeBuilder: (isliked) {
        final color = isliked ? Colors.red : Colors.grey;
        return Icon(Icons.favorite, color: color, size: size);
      },
  
    );
  }
}