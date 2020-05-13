import 'package:flutter/material.dart';

import 'package:contacts/src/models/contact_model.dart';
import 'package:contacts/src/pages/contact_info.dart';

class DataSearch extends SearchDelegate {
  final ContactModelList contactList = ContactModelList();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  String get searchFieldLabel => 'Buscar contactos';

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones de nuestro appbar
    return <Widget>[
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: (){ 
          query = '';
        }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow, 
        progress: transitionAnimation,
      ), 
      onPressed: () {
        close( context, null );
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Crea las sugerencias cuando la persona escribe
    if (query.isEmpty)
      return Container();

    final suggestionList = contactList.contactModelList.where( 
                              (contacto) => contacto.fullname.toLowerCase().contains(
                                query.toLowerCase()
                              )
                            ).toList();


    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext context, int index) {
        var contact = suggestionList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: contact.color,
              child: Text(contact.firstLetter, style: TextStyle(fontSize: 28, color: Colors.white)),
            ),
            title: Text(contact.fullname),
            onTap: () {
              //showResults(context);
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ContactInfo()));
            },
          ),
        );
      },
    );
  }

}