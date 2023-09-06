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
      onSurface:BlackColor ,

    ),
    appBarTheme: AppBarTheme(
        centerTitle: false,
        iconTheme: IconThemeData(color: WhiteColor)),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 30,
        color: WhiteColor,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        color: PrimaryColor,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 25,
        color: Colors.green,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        color: BlackColor,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium:TextStyle(color: BlackColor,fontSize: 14,fontWeight: FontWeight.bold),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: PrimaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: WhiteColor,
      selectedItemColor: PrimaryColor, unselectedItemColor:Colors.grey,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: PrimaryColorDark,
    scaffoldBackgroundColor: PrimaryColorDark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: SecondaryDarkColor,
      onPrimary: WhiteColor,
      secondary: GreenColor,
      onSecondary: WhiteColor,
      error:Colors.red ,
      onError:Colors.redAccent ,
      background:PrimaryColorDark ,
      onBackground:BlackColor,
      surface: Colors.grey,
      onSurface:WhiteColor ,

    ),
    appBarTheme: AppBarTheme(
      backgroundColor: PrimaryColor,
         titleTextStyle: TextStyle(
           fontSize: 30,
           color: BlackColor,
           fontWeight: FontWeight.w700,
         ),
        centerTitle: false,
        iconTheme: IconThemeData(color: BlackColor)),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 30,
        color: BlackColor,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        color: PrimaryColor,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 25,
        color: Colors.green,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        color: BlackColor,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium:TextStyle(color: WhiteColor,fontSize: 14,fontWeight: FontWeight.bold),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: PrimaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: PrimaryColor, unselectedItemColor:WhiteColor,
    ),
  );
}
