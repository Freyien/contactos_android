import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:contacts/src/widgets/custom_divider.dart';
import 'package:contacts/src/widgets/index/contact_list.dart';
import 'package:contacts/src/labs/search_bar.dart';
import 'package:contacts/src/pages/add_contact_page.dart';

import 'package:contacts/src/theme/theme.dart';
import 'package:contacts/src/utils/utils.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<CustomTheme>(context).currentTheme;
    
    return Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      drawer: _Drawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _SearchBarLocation(),
            SizedBox(height: 2),
            _ContactListLocation(),
          ],
        )
      ),
      floatingActionButton: _FloatingActionAdd(),
    );
  }
}

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              _DraweHeader(),
              CustomDivider(),

              _DrawerPages(),
              CustomDivider(),

              _DrawerLabels(),
              CustomDivider(),

              _DrawerConfig(),
              CustomDivider(),

              //Dark Mode
              _DarkModeOption()

            ],
          ),
        ),
      ),
    );
  }
}

class _DraweHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<CustomTheme>(context);

    return Container(
      padding: EdgeInsets.only(left: 17, right: 17, top: 13, bottom: 5),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Icon(Icons.person),
            radius: 17,
            backgroundColor: Color(0xff1A73E9),
            foregroundColor: Colors.white,
          ),

          SizedBox(width: 10),

          Text('Contactos', 
            style: TextStyle(
              fontSize: 27, 
              fontWeight: FontWeight.w300,
              color: (customTheme.isDarkTheme) ? Color(0xff9BA0A6) : Colors.black
            )
          )
        ],
      ),
    );
  }
}

class _DrawerPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<CustomTheme>(context);
    
    final selectedColor = (customTheme.isDarkTheme) ? Color(0xffC4D4EC) : Color(0xff2465C1);
    final trailingSelectedColor = (customTheme.isDarkTheme) ? Color(0xff8AB4F6) : Color(0xff2465C1);

    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        children: <Widget>[
          
          Ink(
            decoration: BoxDecoration(
              color: (customTheme.isDarkTheme) ? Color(0xff394456) : Color(0xffE8F0FD),
              borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))
            ),
            child: ListTile(
              leading: Icon(Icons.person_outline, color: selectedColor),
              title: Text('Contactos', style: TextStyle(color: selectedColor)),
              trailing: Text('156',  style: TextStyle(color: trailingSelectedColor, fontWeight: FontWeight.bold)),
              onTap: (){},
            ),
          ),

          _Option(Icons.error_outline, 'Sugerencias')

          
        ],
      ),
    );
  }
}

class _DrawerLabels extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        ListTile(
          title: Text('Etiquetas'),
        ),

        _Option(Icons.label_outline, 'Family'),

        _Option(Icons.add, 'Crear etiquetas')

      ],
    );
  }
}

class _DrawerConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        _Option(Icons.settings, 'Configuración'),

        _Option(Icons.help_outline, 'Ayuda y comentarios')

      ],
    );
  }
}

class _DarkModeOption extends StatelessWidget {
  const _DarkModeOption({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<CustomTheme>(context);

    return _Option(
      Icons.lightbulb_outline, 
      'Modo Oscuro',
      trailing: Switch.adaptive(
        value: customTheme.isDarkTheme, 
        activeColor: customTheme.currentTheme.colorScheme.secondary,
        onChanged: ( value ) => customTheme.darkTheme = value,
      ),
    );
  }
}

class _ContactListLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ContactList()
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget trailing;

  _Option(
    this.icon, 
    this.text,
    {  
      this.trailing
    }
  );

  @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<CustomTheme>(context);
    final iconColor = (customTheme.isDarkTheme) ? Color(0xff99A0A6) : Colors.black.withOpacity(.7);
    final textColor = (customTheme.isDarkTheme) ? Color(0xffE9EAEE) : Colors.black.withOpacity(.8);

    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))

      ),
      child: ListTile(
        leading: Icon(this.icon, color: iconColor),
        title: Text(this.text, style: TextStyle(color: textColor),),
        trailing: this.trailing,
        onTap: (){
          showSnackBarAndCloseDrawer(context);
        },
      ),
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
      elevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddContactPage()));
      },
      child: Icon(Icons.add, color: Colors.white,),
    );
  }
}