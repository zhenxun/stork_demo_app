import 'package:flutter/material.dart';

//Colors
const kSplashPageBgColor = Color(0xFF0d293d);
const kPrimaryColor = Color(0xFF4267ac);
const kNewPrimaryColor = Color(0xFF4392f1);
const kSecondaryColor = Color(0xFF7678ed);
const kDarkColor = Color(0xFF1a313a);
const kTextColor = Color(0xFF757575);
const kdarkBlue = Color(0xff092E34);
const kSecondaryDarkBlue = Color(0xFF198394);
const klightBlue = Color(0xff489FB5);
const korange = Color(0xffFFA62B);
const kdarkOrange = Color(0xffCC7700);
const kstrongBlue = Color(0xff0070c0);
const kCultured = Color(0xffE9ECEF);
const klightGrey = Color(0xffcccccc);

//Shimmer loading
const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Colors.black,
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
