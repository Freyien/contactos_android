import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class UnderConstructionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _Body()
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Container(
          height: 250,
          margin: EdgeInsets.only(bottom: 15, top: 100),
          child: SvgPicture.asset('assets/svg/under-construction.svg')
        ),

        Text('Pantalla en construcción', 
          style: TextStyle(fontSize: 30, color: Colors.blue)
        ),

      ],
    );
  }
}