import 'package:fliker/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _rememberme = false;

  bool get rememberme => _rememberme;

  set rememberme(bool value) {
    _rememberme = value;
    notifyListeners();
  }

  bool validateForm(context) {
    if (formKey.currentState!.validate()) {
      Provider.of<AuthProvider>(context, listen: false).login(email, password);
      return true;
    } else {
      return false;
    }
  }
}
