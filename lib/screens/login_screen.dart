import 'package:flutter/material.dart';

import 'components/text_form_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ComponentTextFormField(
                hintText: "Adresse Email",
                // validator: (){},
                // onSaved: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
