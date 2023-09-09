import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier{
  String languageCode='en';
  ThemeMode themeMode=ThemeMode.light;
  void ChangeThemeMode(ThemeMode newMode)
  {
    if(themeMode==newMode) return;
    themeMode=newMode;
    notifyListeners();
  }
  void ChangeLanguage(String lang)
  {
    languageCode=lang;
    notifyListeners();
  }
}