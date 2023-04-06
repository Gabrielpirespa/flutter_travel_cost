import 'package:flutter/material.dart';
import 'package:flutter_app_ex1/themes/theme_colors.dart';

ThemeData myTheme = ThemeData(
  primaryColor: ThemeColors.primaryColor, //Se setou primaryColor também tem que setar primarySwatch
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
      backgroundColor: MaterialStateColor.resolveWith( //Não consegui fazer de outra forma para usar MaterialAccentColor.
        (states) => ThemeColors.buttonColor,
      ),
    ),
  ),
);
