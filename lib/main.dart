import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:contacts/src/utils/utils.dart';
import 'package:contacts/src/theme/theme.dart';

import 'package:contacts/src/pages/index.dart'; 

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<CustomTheme>(create: (_) => new CustomTheme(darkTheme: true))
    ],
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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