import 'package:flutter/material.dart';

import 'package:contacts/src/widgets/index/contact_list.dart';
import 'package:contacts/src/labs/search_bar.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _SearchBarLocation(),
            _ContactListLocation(),
          ],
        )
      ),
      floatingActionButton: _FloatingActionAdd(),
    );
  }
}

class _ContactListLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ContactList()
      )
    );
  }
}

class _SearchBarLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: SearchBar()
    );
  }
}

class _FloatingActionAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){},
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }
}