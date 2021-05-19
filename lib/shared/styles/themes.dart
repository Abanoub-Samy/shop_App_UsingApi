import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    primaryColor: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.black54,
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      color: Colors.deepOrange,
    ),
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
    ),
    iconTheme: IconThemeData());

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.purple,
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
    ),
    iconTheme: IconThemeData());