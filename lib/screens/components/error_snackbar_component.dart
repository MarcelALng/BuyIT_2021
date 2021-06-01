import 'package:flutter/material.dart';

class ComponentErrorSnackBar {
  final String errorCode;

  ComponentErrorSnackBar(this.errorCode);

  SnackBar build() {
    String _message;

    switch (errorCode) {
      case "ERROR_USER_NOT_FOUND":
      case "ERROR_WRONG_PASSWORD":
        _message = "Les identifiants sont incorrects, merci de réessayer.";
        break;
    }
    return SnackBar(
      content: Text(_message),
      duration: Duration(seconds: 4),
    );
  }
}
