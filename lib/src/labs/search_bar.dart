import 'package:flutter/material.dart';

import 'package:contacts/src/widgets/custom_divider.dart';
import 'package:contacts/src/search/search_delegate.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _MenuContainer();
  }
}

class _MenuContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1,
            spreadRadius: 0
          )
        ]
      ),
      child: _MenuItem(),
    );
  }
}

class _MenuItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _MenuButton(
          item: MenuButton(
            onPressed: (){ 
              print('Menú'); 
              Scaffold.of(context).openDrawer();
            }, 
            child: Icon(Icons.menu)
          ),
        ),
        _MenuFlatButton(
          item: MenuButton(
            child: Text(
              'Buscar contactos...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey
              ),
            ),
            onPressed: (){  
            
              showSearch(
                context: context, 
                delegate: DataSearch(), 
                //query: 'Hola'
              );
              
            }, 
          ),
        ),
        _MenuButton(
          item: MenuButton(
            onPressed: (){  print('Options');  }, 
            child: Icon(Icons.more_vert)
          ),
        ),
        _MenuButton(
          item: MenuButton(
            onPressed: () {  
              print('Avatar');  
              _showDialog(context);

              
            }
            , 
            child: CircleAvatar( 
              child: Text('F'), 
              maxRadius: 15,
            )
          ),
        )
      ],
    );
  }
}

class _MenuButton extends StatelessWidget {
  final MenuButton item;

  _MenuButton({ @required this.item });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: item.onPressed,
        child: Container(
          padding: EdgeInsets.all(7),
          child: item.child,
        ),
      ),
    );
  }
}

class _MenuFlatButton extends StatelessWidget {
  final MenuButton item;

  _MenuFlatButton({ @required this.item });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: item.onPressed,
        child: Container(
          padding: EdgeInsets.all(7),
          child: item.child,
        ),
      ),
    );
  }
}

class MenuButton {
  final Function onPressed;
  final Widget child;

  MenuButton({
    @required this.onPressed, 
    @required this.child,
  });
}

void _showDialog(context) {
  Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                children: <Widget>[

                  ListTile(
                    leading: CircleAvatar(
                      child: Text('F'),
                    ),
                    title: Text('Fernando Luis Martínez', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    subtitle: Text('ferb.stop@gmail.com', style: TextStyle(fontSize: 12)),
                    trailing: Image.asset('assets/imgs/google-logo.png', height: 30,)
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 30),
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.black12
                          ),
                        ),
                        child: Text('Administrar tu cuenta de Google', style: TextStyle(fontWeight: FontWeight.w500),),
                      ),
                    ],
                  ),            

                ],
              ),
            ),

            CustomDivider(),

            Container(
              padding: EdgeInsets.only(bottom: 15),
              child: Column(
                children: <Widget>[

                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.15),
                      child: Icon(Icons.people_outline, color: Colors.black.withOpacity(.8)),
                    ),
                    title: Text('Fernando Luis Martínez', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                    subtitle: Text('micooreo@gmail.com', style: TextStyle(fontSize: 12)),
                  ),
                  
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.15),
                      child: Icon(Icons.add_circle_outline, color: Colors.black.withOpacity(.8)),
                    ),
                    title: Text('Agregar cuenta', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                    subtitle: Text('ferb.stop@gmail.com', style: TextStyle(fontSize: 12)),
                  ),

                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.15),
                      child: Icon(Icons.lock_outline, color: Colors.black.withOpacity(.8)),
                    ),
                    title: Text('Administrar cuentas en este dispositivo', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                  ),


                ],
              ),
            ),

            CustomDivider(),

            Container(
              padding: EdgeInsets.only(top: 10, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text('Políticas de Privacidad', style: TextStyle(fontSize: 12)),
                  
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle
                    ),
                  ),

                  Text('Condiciones del servicio', style: TextStyle(fontSize: 12))

                ],
              ),
            )

          ],
        ),
      ),
    );

  showDialog( context: context, builder: (BuildContext context) => simpleDialog );
}