

import 'package:flutter/material.dart';
/// login
Color textfl  = Color(0xffdcaf0);
Color sinupbutton  = Color(0xffdaf2f6);
Color field  =Color(0xffdaf2f6);

Color text  = Color(0xff84898d);


Color hin = Color(0xffc1c1c1);
Color back = Color(0xff5A8D8E);


Color bac = Color(0xff5e9b9c);
Color headercolo  = Color(0x001529);// Second

///



TextStyle textstyle  = TextStyle(color: text,);

Theme th = ThemeData(
  useMaterial3: true,




  // Define the default brightness and colors.
  colorScheme: ColorScheme.fromSeed(
    seedColor: textfl,
    // ···
    brightness: Brightness.dark,
  ),

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.bold,
    ),
    // ···
    // titleLarge: GoogleFonts.oswald(
    //   fontSize: 30,
    //   fontStyle: FontStyle.italic,
    // ),
    // bodyMedium: GoogleFonts.merriweather(),
    // displaySmall: GoogleFonts.pacifico(),
  ),
) as Theme;


Color logbu = Color(0xff0dcaf0);


Color ba = Color(0x5e9ea0);
Color sk = Color(0xffffff);