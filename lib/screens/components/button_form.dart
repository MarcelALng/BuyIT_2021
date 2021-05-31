import 'package:flutter/material.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';

class ComponentButtonForm extends StatelessWidget {
  final VoidCallback onPressed;
  final RoundedLoadingButtonController controller;

  ComponentButtonForm({@required this.onPressed, @required this.controller});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RoundedLoadingButton(
        controller: controller,
        onPressed: onPressed,
        child: Text("Se connecter"),
        color: Colors.orange[600],
      ),
    );
  }
}
