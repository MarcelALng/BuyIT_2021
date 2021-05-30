import 'package:flutter/material.dart';

class ComponentTextFormField extends StatelessWidget {
  final String hintText;
  final Function(String) validator;
  final Function(String) onSaved;
  final bool secret;

  ComponentTextFormField({
    @required this.hintText,
    @required this.validator,
    @required this.onSaved,
    this.secret = false,
  });
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        obscureText: secret,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orangeAccent, width: 2.0)),
        ),
      ),
    );
  }
}
