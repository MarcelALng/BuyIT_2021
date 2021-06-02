import 'package:buyit_2021/constants/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';

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
                Text("BuyIT",
                    style: GlobalConstant.getFonts1(
                        color: Colors.white,
                        fontSize: GlobalConstant.getFontSizeTitle(context))),
                SizedBox(height: 15.0),
                Flexible(
                  child: Text(
                    "Tout le High-Tech au meilleur prix",
                    style:
                        GlobalConstant.getFonts2(color: null, fontSize: null),
                  ),
                ),
                SizedBox(height: 5.0),
                ComponentTextFormField(
                  hintText: "Bienvenue: Adresse Email",
                  validator: GlobalConstant.validEmail,
                  onSaved: (value) => _email = value,
                ),
                SizedBox(height: 10.0),
                ComponentTextFormField(
                    secret: true,
                    hintText: "Mot de passe",
                    validator: GlobalConstant.validPassword,
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
