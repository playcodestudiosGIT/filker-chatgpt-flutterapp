import 'package:fliker/models/http/proyectos_respose.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/filker_api.dart';
import 'auth_provider.dart';

class ProyectosProvider extends ChangeNotifier {
  List<Proyecto> proyectos = [];

  obtenerProyectos(BuildContext context) async {
    final id = Provider.of<AuthProvider>(context, listen: false).user!.uid;
    try {
      final resp = await FilkerApi.httpGet('/proyectos/xuser/$id');
      final response = MisProyectosResponse.fromJson(resp);
      proyectos = response.proyectos;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
