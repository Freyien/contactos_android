import 'dart:math';
import 'package:flutter/material.dart';

bool darkColors = false;

Color randomColor() {
  List<Color> colors = [];

  if (darkColors) {
    colors.add(Color(0xffED675C));
    colors.add(Color(0xff5CB973));
    colors.add(Color(0xffAF5BF7));
    colors.add(Color(0xff4DCDE6));
    colors.add(Color(0xffFEC830));
    colors.add(Color(0xffFA8F3D));
    colors.add(Color(0xffFA65B9));
  } else {
    colors.add(Color(0xffF0665B)); //rojo
    colors.add(Color(0xffAF5AFC)); //morado
    colors.add(Color(0xff4DCDE6)); //azul
    colors.add(Color(0xffFCC836)); //amarillo
    colors.add(Color(0xffFE8E3C)); //naranja
    colors.add(Color(0xff5CB875)); //verde
    colors.add(Color(0xffFF63B7)); //rosa
  }
  

  Random random = new Random();
  int index = random.nextInt(colors.length);
  return colors[index];
}