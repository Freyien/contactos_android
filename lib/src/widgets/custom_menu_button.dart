import 'package:flutter/material.dart';

import 'package:contacts/src/utils/utils.dart';

class CustomMenuButton extends StatelessWidget {
  final List<Choice> choices;
  
  const CustomMenuButton({
    @required this.choices
  });

  @override
  Widget build(BuildContext context) {

    return PopupMenuButton<Choice>(
      icon: Icon(Icons.more_vert, color: Colors.black87,),
      onSelected: (value) {
        showSnackBar(context);
      },
      itemBuilder: (BuildContext context) {
        return choices.map((Choice choice) {
          return PopupMenuItem<Choice>(
            value: choice,
            child: Text(choice.title),
          );
        }).toList();
      },
    );
  }
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Ayuda y comentarios'),
];

class Choice {
  const Choice({this.title});

  final String title;
}