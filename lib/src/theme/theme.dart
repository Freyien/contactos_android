import 'package:contacts/src/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier{
  bool _isDarkTheme   = false;
  ThemeData _currentTheme;
  
  ThemeData _darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color(0xff202125),
    backgroundColor: Color(0xff303135),
    iconTheme: IconThemeData(
      color: Color(0xff9DA1A4)
    ),
    colorScheme: ColorScheme.dark(
      secondary: Color(0xff2D69C1), //FAB
    ),
    canvasColor: Color(0xff414246), //Drawer
  );

  ThemeData _lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.dark(
      secondary: Color(0xff1A73E9), //FAB
    ),
  );

  //constructor
  CustomTheme( { @required bool darkTheme } ) {
    setTheme(darkTheme);
  }

  //Getters
  bool get isDarkTheme => this._isDarkTheme;
  ThemeData get currentTheme => this._currentTheme;

  //Setters
  set darkTheme(bool darkTheme) {
    setTheme(darkTheme);
    notifyListeners();
  }

  //Methos
  void setTheme(bool darkTheme) {
    if (darkTheme) {
      this._isDarkTheme = true;
      this._currentTheme = this._darkTheme;
      darkColors = true; //utils
    } else {
      this._isDarkTheme = false;
      this._currentTheme = this._lightTheme;
      darkColors = false; //utils
    }
  }
    
}