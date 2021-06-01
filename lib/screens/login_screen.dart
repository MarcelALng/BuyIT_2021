import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:string_validator/string_validator.dart' as validate;
import 'package:firebase_auth/firebase_auth.dart';

import 'components/button_form_component.dart';
import 'components/text_form_field_component.dart';
import 'components/error_snackbar_component.dart';

class LoginScreen extends StatelessWidget {
  final RoundedLoadingButtonController _buttonController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final GlobalKey<ScaffoldState> _scaffoldK = GlobalKey<ScaffoldState>();

    final FirebaseAuth _controllerFirebase = FirebaseAuth.instance;
    final MediaQueryData _device = MediaQuery.of(context);
    final double _fontSizeTitle = _device.orientation == Orientation.portrait
        ? _device.size.height * 0.10
        : _device.size.height * 0.05;
    String _email;
    String _password;

    return Scaffold(
      key: _scaffoldK,
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
                    onReset: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: "Se connecter",
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _controllerFirebase
                            .signInWithEmailAndPassword(
                                email: _email, password: _password)
                            .then((value) =>
                                _controllerFirebase.currentUser().then((value) {
                                  return _buttonController.success();
                                }))
                            .catchError((onError) {
                          _buttonController.error();
                          _scaffoldK.currentState.showSnackBar(
                              ComponentErrorSnackBar(onError.code).build());
                        });
                      }
                      _buttonController.error();
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
