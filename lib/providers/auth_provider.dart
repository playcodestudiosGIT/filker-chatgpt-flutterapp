import 'package:fliker/api/filker_api.dart';
import 'package:fliker/models/http/auth_response.dart';
import 'package:fliker/services/local_storage.dart';
import 'package:fliker/services/notifications_service.dart';
import 'package:flutter/material.dart';

import '../models/usuario_model.dart';
import '../router/router.dart';
import '../services/navigation_service.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    isAutenticated();
  }

  login(String email, String password) async {
    final data = {'correo': email, 'password': password};

    FilkerApi.post('/auth/login', data).then((json) {
      final authResponse = AuthResponse.fromJson(json);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigatorService.navigateTo(Flurorouter.myAccRoute);
      FilkerApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      NotificationsServices.showSnackbarError('Credenciales invalidas', Colors.red);
    });
  }

  Future<bool> isAutenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final resp = await FilkerApi.httpGet('/auth');
      final authResponse = AuthResponse.fromJson(resp);
      user = authResponse.usuario;
      _token = authResponse.token;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      NotificationsServices.showSnackbarError(e.toString(), Colors.red);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logOut() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    NavigatorService.navigateTo(Flurorouter.homeRoute);
    notifyListeners();
  }

  register(String email, String password, String name, String lastName) async {
    final data = {'nombre': name, 'apellido': lastName, 'correo': email, 'password': password};

    FilkerApi.post('/usuarios', data).then((json) {
      final authResponse = AuthResponse.fromJson(json);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigatorService.navigateTo(Flurorouter.myAccRoute);
      notifyListeners();
      FilkerApi.configureDio();
    }).catchError((e) {
      NotificationsServices.showSnackbarError('Correo ya existe. ir al Log in', Colors.red);
    });
  }
}
