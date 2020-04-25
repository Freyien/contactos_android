import 'dart:async';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

import 'package:contacts/src/pages/index.dart';
import 'package:contacts/src/utils/utils.dart';

import 'package:contacts/src/models/accounts_dialog_model.dart';
import 'package:contacts/src/widgets/custom_menu_button.dart';

class AddContactPage extends StatelessWidget {
  final List<Choice> choices = const <Choice>[
    const Choice(title: 'Ayuda y comentarios'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black), 
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
        backgroundColor: Colors.white,
        title: Text('Crear contacto', style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          FlatButton(
            child: Text('Guardar', style: TextStyle(color: Color(0xff2465C1), fontSize: 15),),
            onPressed: (){
              FocusScope.of(context).requestFocus(FocusNode());
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => IndexPage())); 
            }, 
          ),

          CustomMenuButton(choices: choices),

        ],
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (_) => AccountsDialogModel(),
          child: _Body()
        )
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accountsDialogModel = Provider.of<AccountsDialogModel>(context);

    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            _SaveIn(),

            _Form(),
          ],
        ),

        if (accountsDialogModel.show)
          _Accounts(),
      ],
    );
  }
}

class _Accounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accountsDialogModel = Provider.of<AccountsDialogModel>(context);

    void hideAcoountsCard() {

      accountsDialogModel.controller.reverse();
      Timer(Duration(milliseconds: 400), () {
          accountsDialogModel.show = false;
      });
    }

    return Stack(
      children: <Widget>[

        GestureDetector(
          onTap: (){
            hideAcoountsCard();
          },
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
          ),
        ),
        
        FadeInDown(
          from: 40,
          duration: Duration(milliseconds: 400),
          controller: (animationController) => accountsDialogModel.controller = animationController,
          child: Container(
            margin: EdgeInsets.only(top: 60),
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black12,
                  offset: Offset(0, 7),
                )
              ],
              border: Border.all(
                color: Colors.grey.withOpacity(.5)
              )

            ),
            child: Column(
              children: <Widget>[

                Material(
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('F', style: TextStyle(color: Colors.white, fontSize: 23)),
                    ),
                    title: Text('Fernando Luis Martínez', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    subtitle: Text('ferb.stop@gmail.com', style: TextStyle(fontSize: 13)),
                    onTap: (){ 
                      hideAcoountsCard();
                      accountsDialogModel.emailSelected = 'ferb.stop@gmail.com';
                      accountsDialogModel.colorSelected = Colors.blue[700];
                      accountsDialogModel.childSelected = CircleAvatar(
                        child: Text('F', style: TextStyle(color: Colors.white)),
                      );
                    },
                  ),
                ),

                Material(
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.pink,
                      child: Text('F', style: TextStyle(color: Colors.white, fontSize: 23)),
                    ),
                    title: Text('Fernando Luis Martínez', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    subtitle: Text('fernandoluis@recursoconfiable.com', style: TextStyle(fontSize: 13)),
                    onTap: (){ 
                      hideAcoountsCard();
                      accountsDialogModel.emailSelected = 'fernandoluis@recursoconfiable.com';
                      accountsDialogModel.colorSelected = Colors.pink;
                      accountsDialogModel.childSelected = CircleAvatar(
                        backgroundColor: Colors.pink,
                        child: Text('F', style: TextStyle(color: Colors.white)),
                      );
                    },
                  ),
                ),

                Material(
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.15),
                      child: Icon(Icons.phone_android, color: Colors.black.withOpacity(.7)),
                    ),
                    title: Text('Dispositivo', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    onTap: (){ 
                      hideAcoountsCard();
                      accountsDialogModel.emailSelected = 'Dispositivo';
                      accountsDialogModel.colorSelected = Colors.grey.withOpacity(.15);
                      accountsDialogModel.childSelected = CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(.15),
                        child: Icon(Icons.phone_android, color: Colors.black.withOpacity(.7)),
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
    
      ],
    );
  }
}

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: <Widget>[

          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 40),
            child: CircleAvatar( 
              child: Icon(Icons.photo_camera, size: 30),
              radius: 30,
            ),
          ),

          _RowTextField('Nombre', prefixIcon: Icons.person_outline),
          _RowTextField('Apellido'),
          _RowTextField('Empresa', prefixIcon: Icons.location_city),
          _RowTextField('Teléfono', prefixIcon: Icons.phone, textType: TextInputType.phone),
          
          _RowTextField('Etiqueta', inputType: 'DROPDOWNBUTTON', textList: ['Celular', 'Laboral', 'Particular' ,'Principal', 'Localizador', 'Otro', 'Sin etiqueta']),

          _RowTextField('Correo electrónico', prefixIcon: Icons.mail_outline, textType: TextInputType.emailAddress),
          _RowTextField('Etiqueta', inputType: 'DROPDOWNBUTTON', textList: ['Sin etiqueta', 'Particular', 'Laboral' ,'Otro']),


        ],
      ),
    );
  }
}

class _RowTextField extends StatefulWidget {
  final String text;
  final IconData prefixIcon;
  final TextInputType textType;
  final String inputType;
  final List<String> textList;

  _RowTextField(
    this.text, 
    { 
      this.prefixIcon,
      this.textType = TextInputType.text,
      this.inputType = 'TEXT',
      this.textList
    }
  );

  @override
  __RowTextFieldState createState() => __RowTextFieldState();
}

class __RowTextFieldState extends State<_RowTextField> {
  TextEditingController controller = TextEditingController();
  Widget suffixIcon;
  Widget icon;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget.prefixIcon != null)
      icon = Icon(this.widget.prefixIcon, size: 25);
    else
      icon = Icon(Icons.android, size: 25, color: Colors.white);

    if (this.widget.inputType == 'DROPDOWNBUTTON')
      suffixIcon = Icon(Icons.arrow_drop_down, size: 25, color: Colors.black87);

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Stack(
        children: <Widget>[

          TextField(
            controller: controller,
            onChanged: (value) {
              setState(() {
                if (value == '')
                  suffixIcon = null;
                else
                  suffixIcon = IconButton(icon: Icon(Icons.clear), onPressed: (){   
                    Timer(Duration(milliseconds: 50), () {
                      controller.clear(); 
                    });
                  });
              });
            },
            keyboardType: this.widget.textType,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7)
              ),
              icon: icon,
              suffixIcon: suffixIcon,
              hintText: this.widget.text,
              labelText: this.widget.text,
            )
          ),

          if (this.widget.inputType == 'DROPDOWNBUTTON')
            Opacity(
              opacity: 0,
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                color: Colors.red,
                child: DropdownButton(
                  isExpanded: true,
                  items: this.widget.textList.map((String hey) {
                    return new DropdownMenuItem<String>(
                      value: hey,
                      child: new Text(hey),
                    );
                  }).toList(),
                  icon: Icon(Icons.keyboard_arrow_down),
                  onChanged: (value){
                    controller.text = value;
                  },
                ),
              ),
            ),

        
        ],
      ),
    );
  }
}

class _SaveIn extends StatefulWidget {
  @override
  __SaveInState createState() => __SaveInState();
}

class __SaveInState extends State<_SaveIn> with SingleTickerProviderStateMixin{
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500) );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountsDialogModel = Provider.of<AccountsDialogModel>(context);

    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 60,
      color: Colors.grey.withOpacity(.4),
      child: Row(
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text('Guardar en', style: TextStyle(fontWeight: FontWeight.bold))
          ),

          GestureDetector(
            onTap: () {              
              accountsDialogModel.show = true;
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .60,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Row(
                children: <Widget>[

                  if (accountsDialogModel.childSelected != null)
                    accountsDialogModel.childSelected
                  else
                    CircleAvatar(
                      child: Text('F'),
                    ),
                  
                  SizedBox(width: 5),

                  Expanded(
                    child: Text(accountsDialogModel.emailSelected, 
                      style: TextStyle(fontWeight: FontWeight.w600), 
                      overflow: TextOverflow.ellipsis
                    )
                  ),

                  Icon(Icons.keyboard_arrow_down)

                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}