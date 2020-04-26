import 'package:contacts/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDivider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<CustomTheme>(context);

    if (customTheme.isDarkTheme)
      return Divider(color: Color(0xff58595D));
    else
      return Divider(color: Colors.black38);
  }
}