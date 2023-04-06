import 'package:flutter/material.dart';
import 'package:flutter_app_ex1/themes/theme_colors.dart';

ThemeData MyTheme = ThemeData(
  primaryColor: ThemeColors.primaryColor,
  primarySwatch: ThemeColors.primaryColor,
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.white,
    centerTitle: true,
    backgroundColor: ThemeColors.appBarColor,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelStyle: TextStyle(
      color: Colors.black54,
      fontSize: 21
    ),
    border: OutlineInputBorder(),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith(
        (states) => ThemeColors.buttonColor,
      ),
    ),
  ),
);
