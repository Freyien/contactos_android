//import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';



class UserPreferences {
  static final UserPreferences _userPreferences = new UserPreferences._internal();

  factory UserPreferences() {
    return _userPreferences;
  }

  UserPreferences._internal();

  //Properties
  SharedPreferences _prefs;

  //Getters
  bool get isDarkTheme => _prefs.getBool('isDarkTheme') ?? false;

  //Setters
  set isDarkTheme(bool isDarkTheme) {
    _prefs.setBool('isDarkTheme', isDarkTheme);
  }

  //Methods
  Future<void> initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }


}