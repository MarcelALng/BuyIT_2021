import 'package:flutter/material.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';

class ComponentButtonForm extends StatelessWidget {
  final VoidCallback onPressed;
  final RoundedLoadingButtonController controller;
  final String child;

  ComponentButtonForm(
      {@required this.onPressed,
      @required this.controller,
      @required this.child});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RoundedLoadingButton(
        controller: controller,
        onPressed: onPressed,
        child: Text(child),
        color: Colors.orange[600],
      ),
    );
  }
}
