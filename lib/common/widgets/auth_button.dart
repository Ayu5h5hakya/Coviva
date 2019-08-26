import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum AuthActions { logIn, logOut }

class AuthButton extends StatelessWidget {
  final bool visible;
  final void Function(AuthActions value) authAction;

  AuthButton({Key key, 
              @required this.visible,
              @required this.authAction}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    final iconButton = IconButton(
      icon: Icon(Icons.input),
      onPressed: (){
        authAction(AuthActions.logIn);
      },
    );
    return Opacity(
      opacity: visible ? 1.0 : 0.0,
      child: visible ? iconButton : IgnorePointer(child: iconButton),
    );
  }
}