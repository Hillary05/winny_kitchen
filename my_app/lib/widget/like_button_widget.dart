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
      likeCount: likeCount,
      likeBuilder: (isliked) {
        final color = isliked ? Colors.red : Colors.grey;
        return Icon(Icons.favorite, color: color, size: size);
      },
      likeCountPadding: EdgeInsets.only(left: 12),
      countBuilder: (count, isliked, text) {
        final color = isliked ? Colors.black87 : Colors.grey;
        return Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        );
      },

      onTap: (isliked) async {
        this.isliked = !isliked;
        likeCount += this.isliked ? 1 : -1;

        return !isliked;
      },
    );
  }
}