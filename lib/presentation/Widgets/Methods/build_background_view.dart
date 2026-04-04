import 'package:flutter/material.dart';
import 'package:medoraapp/constants/assets.dart';

BoxDecoration BiuldBackgroundView() {
  return BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.fill,
      image: AssetImage(Assets.createAccont),
    ),
  );
}
