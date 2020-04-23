import 'package:contacts/src/pages/add_contact_page.dart';
import 'package:flutter/material.dart';

import 'package:contacts/src/pages/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: IndexPage(),
    );
  }
}