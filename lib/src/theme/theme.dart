import 'package:contacts/src/user_prefs/user_preferences.dart';
import 'package:contacts/src/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier{
  final _prefs = new UserPreferences();
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
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Color(0xff9DA1A4)
      ),
      iconTheme: IconThemeData(
        color: Color(0xff9DA1A4)
      ),
      textTheme: TextTheme(
        headline6: TextStyle(color: Color(0xff9DA1A4), fontSize: 21),
      ),
    ),
    accentColor: Color(0xff95B5E9)

  );

  ThemeData _lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    colorScheme: ColorScheme.dark(
      secondary: Color(0xff1A73E9), //FAB
      onSurface: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.black87
      ),
      iconTheme: IconThemeData(
        color: Colors.black87
      ),
      textTheme: TextTheme(
        //title: TextStyle(color: Colors.black87, fontSize: 21)
        headline6: TextStyle(color: Colors.black87, fontSize: 21)
      )
    )
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
      _prefs.isDarkTheme = true;
    } else {
      this._isDarkTheme = false;
      this._currentTheme = this._lightTheme;
      darkColors = false; //utils
      _prefs.isDarkTheme = false;
    }
  }
    
}