import 'package:flutter/material.dart';
import 'package:contacts/src/utils/utils.dart';

import 'package:contacts/src/pages/add_contact_page.dart';
import 'package:contacts/src/widgets/custom_divider.dart';
import 'package:contacts/src/widgets/custom_menu_button.dart';

class ContactInfo extends StatefulWidget {
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  final List<Choice> choices = const <Choice>[
    const Choice(title: 'Ver contactos vinculados'),
    const Choice(title: 'Borrar'),
    const Choice(title: 'Compartir'),
    const Choice(title: 'Agregar a pantalla principal'),
    const Choice(title: 'Establecer tono'),
    const Choice(title: 'Dirigir al correo de voz'),
    const Choice(title: 'Mover a otra cuenta'),
    const Choice(title: 'Ayuda y comentarios'),
  ];

  bool starIsActived = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('data'),
        actions: <Widget>[

          IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon((starIsActived)
                      ? Icons.star
                      : Icons.star_border,
              color: Colors.black87
            ), 
            onPressed: (){
              setState(() {
                starIsActived = !starIsActived;
              });
            }
          ),

          CustomMenuButton(choices: choices)

        ],
      ),
      body: SingleChildScrollView(
        child: _Body()
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue[700],
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddContactPage() ));
        }, 
        icon: Icon(Icons.edit),
        label: Text('Editar contacto'),
      )
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        _Header(),

        CustomDivider(),

        _Actions(),

        CustomDivider(),

        ListTile(
          leading: Icon(Icons.phone_android),
          title: Text('+52 1 55 1234 5678'),
          subtitle: Text('Celular'),
          trailing: IconButton(icon: Icon(Icons.message), onPressed: () { showSnackBar(context); }),
          onTap: () { showSnackBar(context); },
        ),

        _CustomListDivider(),

        ListTile(
          leading: Icon(Icons.phone),
          title: Text('+52 1 55 1234 5678'),
          subtitle: Text('Local'),
          onTap: () { showSnackBar(context); },
        ),

        _CustomListDivider(),

      ],
    );
  }
}

class _Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[

        _Action('Llamar', Icons.phone),
        _Action('Mensajde texto', Icons.message),
        _Action('Configurar', Icons.settings)

      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [

          Container(
            margin: EdgeInsets.only(bottom: 30),
            alignment: Alignment.center,
            child: CircleAvatar(
              child: Text('A', style: TextStyle(fontSize: 50),),
              radius: 45,
            ),
          ),

          Container(
            alignment: Alignment.centerLeft,
            child: Text('Alexandra', style: TextStyle(fontSize: 29),),
          ),

        ]
      ),
    );
  }
}

class _CustomListDivider extends StatelessWidget {
  const _CustomListDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: .5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.black38
          ]
        )
      ),
    );
  }
}

class _Action extends StatelessWidget {
  final String text;
  final IconData icon;

  const _Action(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { showSnackBar(context); },
      child: Container(
        //padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[

            Icon(this.icon, color: Colors.blue[700]),
            SizedBox(height: 7),
            Text(this.text, style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.w600),)

          ],
        ),
      ),
    );
  }
}