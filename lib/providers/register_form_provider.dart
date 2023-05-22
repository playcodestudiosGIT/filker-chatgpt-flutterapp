import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String lastName = '';
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
      
      // Provider.of<AuthProvider>(context, listen: false).register(email, password, name, lastName);

      return true;
    } else {
      return false;
    }
  }
}
