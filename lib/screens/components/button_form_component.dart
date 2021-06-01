import 'package:flutter/material.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';

class ComponentButtonForm extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback onReset;
  final RoundedLoadingButtonController controller;
  final String child;

  ComponentButtonForm(
      {@required this.onPressed,
      @required this.controller,
      @required this.child,
      this.onReset});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedLoadingButton(
            controller: controller,
            onPressed: onPressed,
            child: Text(child),
            color: Colors.orange[600],
          ),
          Flexible(
            child: FlatButton(
                onPressed: () {
                  if (onReset != null) onReset();

                  controller.reset();
                },
                child: Text('Reset')),
          )
        ],
      ),
    );
  }
}
