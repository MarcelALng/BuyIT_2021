import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:string_validator/string_validator.dart' as validate;
import 'package:firebase_auth/firebase_auth.dart';

import 'components/button_form.dart';
import 'components/text_form_field.dart';

class LoginScreen extends StatelessWidget {
  final RoundedLoadingButtonController _buttonController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final FirebaseAuth _controllerFirebase = FirebaseAuth.instance;

    final double _fontSizeTitle = MediaQuery.of(context).size.height * 0.15;
    String _email;
    String _password;

    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BuyIT",
                  style: GoogleFonts.satisfy(
                    color: Colors.white,
                    fontSize: _fontSizeTitle,
                  ),
                ),
                SizedBox(height: 15.0),
                Flexible(
                  child: Text(
                    "Tout le High-Tech au meilleur prix",
                    style: GoogleFonts.comfortaa(),
                  ),
                ),
                SizedBox(height: 5.0),
                ComponentTextFormField(
                  hintText: "Bienvenue: Adresse Email",
                  validator: (value) {
                    if (!validate.isEmail(value))
                      return "Erreur adresse email incorrect";
                    return null;
                  },
                  onSaved: (value) => _email = value,
                ),
                SizedBox(height: 10.0),
                ComponentTextFormField(
                    secret: true,
                    hintText: "Mot de passe",
                    validator: (value) {
                      if (validate.isAlphanumeric(value)) {
                        if (value.length < 6) {
                          return "Erreur, le mot de passe doit contenir 6 caractères au minimum";
                        }
                        return "Erreur le mot de passe doit contenir un symbole, des lettres et des chiffres";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value;
                    }),
                SizedBox(height: 20.0),
                ComponentButtonForm(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _controllerFirebase
                            .createUserWithEmailAndPassword(
                                email: _email, password: _password)
                            .then((value) => _controllerFirebase
                                .currentUser()
                                .then((value) => print(value.email)))
                            .catchError((onError) => print(onError));
                        _buttonController.success();
                      }
                    },
                    controller: _buttonController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
