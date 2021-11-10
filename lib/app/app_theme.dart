import 'package:flutter/material.dart';

class ThemeLoginApp {
  ThemeLoginApp._();

  static const Color appColor = Colors.purple;
  static const Color accentColor = Color(0xFFF838383);
  static const Color textColor = Colors.black;
  static const Color backgroundColor = Colors.white;

  static const Color kColorDarkGrey = Color(0xFFF171414);
  static const Color kColorDarkrGreyLight = Color(0xFFF272727);
  static const Color kColorLightGrey = Color(0xFFF838383);
  static const Color kColorLightGrey1 = Color(0xFFFE1DBDB);
  static const Color kColorLightGrey2 = Color(0xFFF8B8989);

  static const BoxShadow kDefaultShadow = BoxShadow(
    offset: Offset(0, 2),
    blurRadius: 2,
    color: Colors.black,
  );

  static const TextStyle nameStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle occupationStyle = TextStyle(
    color: accentColor,
    fontSize: 12,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle nameBigStyle = TextStyle(
    color: Colors.white,
    fontSize: 40,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle descriptionStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    height: 1.2,
  );

  static const TextStyle descriptionBoldStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    height: 1.2,
    fontWeight: FontWeight.w800,
  );

  static const MaterialColor appMaterialColor = MaterialColor(
    0xFF000000,
    <int, Color>{
      50: Colors.black,
      100: Colors.black,
      200: Colors.black,
      300: Colors.black,
      400: Colors.black,
      500: Colors.black,
      600: Colors.black,
      700: Colors.black,
      800: Colors.black,
      900: Colors.black,
    },
  );
}
