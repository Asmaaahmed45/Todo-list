import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {

  static final ThemeData lightTheme = ThemeData(
    primaryColor: PrimaryColor,
    scaffoldBackgroundColor: OnprimaryColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: PrimaryColor,
      onPrimary: WhiteColor,
      secondary: GreenColor,
      onSecondary: WhiteColor,
      error:Colors.red ,
      onError:Colors.redAccent ,
      background:OnprimaryColor ,
      onBackground:BlackColor,
      surface: Colors.grey,
      onSurface:WhiteColor ,

    ),
    appBarTheme: AppBarTheme(
        centerTitle: false,
        iconTheme: IconThemeData(color: WhiteColor)),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        color: WhiteColor,
        fontWeight: FontWeight.w700,
      ),
      subtitle1: TextStyle(
        fontSize: 25,
        color: PrimaryColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: TextStyle(
        fontSize: 25,
        color: Colors.green,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        fontSize: 20,
        color: BlackColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: WhiteColor,
        selectedItemColor: PrimaryColor, unselectedItemColor:Colors.grey,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: PrimaryColor,
    scaffoldBackgroundColor: PrimaryColorDark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: PrimaryColor,
      onPrimary: WhiteColor,
      secondary: GreenColor,
      onSecondary: WhiteColor,
      error:Colors.red ,
      onError:Colors.redAccent ,
      background:OnprimaryColor ,
      onBackground:BlackColor,
      surface: Colors.grey,
      onSurface:WhiteColor ,

    ),
    appBarTheme: AppBarTheme(
        centerTitle: false,
        iconTheme: IconThemeData(color: BlackColor)),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        color: BlackColor,
        fontWeight: FontWeight.w700,
      ),
      subtitle1: TextStyle(
        fontSize: 25,
        color: PrimaryColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: TextStyle(
        fontSize: 25,
        color: Colors.green,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        fontSize: 20,
        color: BlackColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: BlackColor,
      selectedItemColor: PrimaryColor, unselectedItemColor:BlackColor,
    ),
  );
}
