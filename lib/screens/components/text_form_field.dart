import 'package:flutter/material.dart';

class ComponentTextFormField extends StatelessWidget {
  final String hintText;
  // final Function(String) validator;
  // final Function(String) onSaved;

  ComponentTextFormField({
    @required this.hintText,
    // @required this.validator,
    // @required this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        // validator: validator,
        // onSaved: onSaved,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orangeAccent)),
        ),
      ),
    );
  }
}
