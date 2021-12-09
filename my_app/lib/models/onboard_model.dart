import 'package:flutter/material.dart';

class OnboardModel {
  String img;
  String text;
  String desc;
  Color bg;
  Color button;

  OnboardModel({
    required this.img,
    required this.text,
    required this.desc,
    required this.bg,
    required this.button,
  });
}

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
    img: "images/one.png",
    text: "Discover",
    desc: "Discover the different flavors of cooking",
    bg: Colors.white,
    button: Color(0XFF4756DF),
  ),
  OnboardModel(
    img: "images/four.png",
    text: "Learn",
    desc: "Learn to cook different and delicious dishes",
    bg: Colors.white,
    button: Color(0XFF4756DF),
  ),
  OnboardModel(
    img: "images/Cooking.png",
    text: "Enjoy",
    desc: "Have fun !",
    bg: Colors.white,
    button: Color(0XFF4756DF),
  ),
];
