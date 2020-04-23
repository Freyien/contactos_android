import 'package:flutter/material.dart';

class FABExpanded extends StatelessWidget {
  final bool isExtended;
  final double width;

  FABExpanded(this.isExtended, this.width);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: AnimatedContainer(
        width: width,
        height: 45,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black,
              offset: Offset(5, 0)
            )
          ]
        ),
        child: OverflowBox(
          maxWidth: width,
          maxHeight: 45,
          child: RawMaterialButton(
            onPressed: () => null,
            fillColor: Colors.blue[600],
            child: isExtended
              ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Editar contacto",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )
              : Icon(Icons.edit, color: Colors.white)
          ),
        )
      ),
    );
  }
}