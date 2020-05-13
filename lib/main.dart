import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:contacts/src/utils/utils.dart';
import 'package:contacts/src/theme/theme.dart';
import 'package:contacts/src/user_prefs/user_preferences.dart';
import 'package:contacts/src/pages/index.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final _prefs = new UserPreferences();
  await _prefs.initPrefs();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CustomTheme>(create: (_) => new CustomTheme(darkTheme: _prefs.isDarkTheme))
      ],
      child: MyApp(),
    )
  );
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<CustomTheme>(context);
    
    statusBarTransparent(customTheme.isDarkTheme);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme.currentTheme,
      title: 'Diseños App',
      home: IndexPage(),
    );
  }
}