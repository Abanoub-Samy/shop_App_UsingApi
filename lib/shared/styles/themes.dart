import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    primaryColor: Colors.deepOrange,
    accentColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black54,
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      color: Colors.deepOrange,
    ),
    fontFamily: 'Lato',
    primarySwatch: Colors.deepOrange,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData());

ThemeData lightTheme = ThemeData(
    fontFamily: 'Lato',
    primaryColor: Colors.purple,
    accentColor: Colors.black38,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.purple,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),

    ),
    iconTheme: IconThemeData());
