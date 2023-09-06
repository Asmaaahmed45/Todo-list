import 'package:flutter/material.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/styles/themes.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute:HomeLayout.routeName,
      routes: {
       HomeLayout.routeName:(context)=>HomeLayout(),
      },
      theme:MyThemeData.lightTheme,
      darkTheme:MyThemeData.darkTheme ,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}

