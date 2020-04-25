import 'package:flutter/material.dart';

void showSnackBarAndCloseDrawer(context) {
  closeDrawer(context);

  showSnackBar(context);
}

void showSnackBar(context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text("Función no implementada"),
    duration: Duration(milliseconds: 400),
  ));
}

void closeDrawer(context) {
  Navigator.pop(context);
}