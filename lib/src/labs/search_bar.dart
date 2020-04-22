import 'package:flutter/material.dart';

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
            onPressed: (){  print('Buscar contactos');  }, 
            child: Text(
              'Buscar contactos...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey
              ),
            )
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
            onPressed: () {  print('Avatar');  }, 
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