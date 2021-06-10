import 'package:flutter/material.dart';

import 'package:string_validator/string_validator.dart' as validate;

import 'package:google_fonts/google_fonts.dart';

class GlobalConstant {
  static TextStyle getFonts1({
    Color color = Colors.white,
    double fontSize,
  }) {
    return GoogleFonts.satisfy(color: color, fontSize: fontSize);
  }

  static TextStyle getFonts2({
    Color color = Colors.white,
    double fontSize,
  }) {
    return GoogleFonts.comfortaa(color: color, fontSize: fontSize);
  }

  static double getFontSizeTitle(BuildContext context) {
    final MediaQueryData _device = MediaQuery.of(context);
    final double _fontSizeTitle = _device.orientation == Orientation.portrait
        ? _device.size.height * 0.10
        : _device.size.height * 0.05;
    return _fontSizeTitle;
  }

  static String validPassword(String password) {
    if (validate.isAlphanumeric(password)) {
      if (password.length < 6) {
        return "Erreur, le mot de passe doit contenir 6 caractères au minimum";
      }
      return "Erreur le mot de passe doit contenir un symbole, des lettres et des chiffres";
    }
    return null;
  }

  static String validEmail(String email) {
    if (!validate.isEmail(email)) return "Erreur adresse email incorrect";
    return null;
  }

  static ThemeData getDarkTheme() {
    return ThemeData.dark().copyWith(
        bannerTheme:
            MaterialBannerThemeData(backgroundColor: Colors.deepOrange),
        buttonColor: Colors.orange[600],
        snackBarTheme: SnackBarThemeData(
            contentTextStyle: getFonts2(color: Colors.white, fontSize: null)));
  }
}
