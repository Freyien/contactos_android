import 'package:flutter/material.dart';
import 'dart:math';

Color randomColor() {
  List colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.blueAccent,
    Colors.purple,
    Colors.orange
  ];

  Random random = new Random();
  int index = random.nextInt(colors.length);
  return colors[index];
}