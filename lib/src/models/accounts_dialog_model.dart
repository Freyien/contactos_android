import 'package:flutter/material.dart';

class AccountsDialogModel with ChangeNotifier{
  //properties
  bool _show = false;
  AnimationController _controller;
  String _emailSelected = 'ferb.stop@gmail.com';
  Color _colorSelected;
  Widget _childSelected;

  //Getters
  bool get show => this._show;
  AnimationController get controller => this._controller;
  String get emailSelected => this._emailSelected;
  Color get colorselected => this._colorSelected;
  Widget get childSelected => this._childSelected;

  //Setters
  set show(bool show) {
    this._show = show;
    notifyListeners();
  }

  set controller(AnimationController controller) {
    this._controller = controller;
  }

  set emailSelected(String emailSelected) {
    this._emailSelected = emailSelected;
  }

  set colorSelected(Color colorSelected) {
    this._colorSelected = colorSelected;
  }

  set childSelected(Widget childSelected) {
    this._childSelected = childSelected;
  }
}