import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_eco_magazine_app/shared_widgets/colors.dart';

// final kLightTheme = ThemeData(
//   brightness: Brightness.light,
//   primarySwatch: _colorCustom,
//   primaryColor: _colorCustom,
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     backgroundColor: Colors.white,
//     selectedItemColor: _colorCustom,
//     unselectedItemColor: Colors.black,
//   ),
//   visualDensity: VisualDensity.adaptivePlatformDensity,
//   // accentColor: Colors.pinkAccent[100],
//   scaffoldBackgroundColor: Colors.white,
//   // buttonColor: Color(0xFFE9F0F4),
// );

final kDarktTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: _colorCustom,
  primaryColor: _colorCustom,
  textTheme: TextTheme(
    headline1: GoogleFonts.tulpenOne(
      fontSize: 20.0,
      color: Color(0xffdfdfdf),
    ),
    headline2: GoogleFonts.inter(
      color: Color(0xffdfdfdf),
    ),
    bodyText1: GoogleFonts.oswald(
      fontSize: 16.0,
      color: Color(0xffdfdfdf),
    ),
    bodyText2: GoogleFonts.inter(
      fontSize: 16.0,
      color: Color(0xffdfdfdf),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: _colorCustom,
    unselectedItemColor: Colors.white,
  ),
  accentColor: secondaryColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: Colors.black,
  // buttonColor: Color(0xFF222427),
);

final MaterialColor _colorCustom = MaterialColor(0xFFfab707, _themeColor);

final Map<int, Color> _themeColor = {};
