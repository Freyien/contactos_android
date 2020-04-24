import 'package:flutter/material.dart';

class AccountsDialogModel with ChangeNotifier{
  //properties
  bool _show = false;
  AnimationController _controller;

  //Getters
  bool get show => this._show;
  AnimationController get controller => this._controller;

  //Setters
  set show(bool show) {
    this._show = show;
    notifyListeners();
  }

  set controller(AnimationController controller) {
    this._controller = controller;
  }
}