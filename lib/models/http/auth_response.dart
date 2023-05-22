// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fliker/models/usuario_model.dart';

class AuthResponse {
    Usuario usuario;
    String token;

    AuthResponse({
        required this.usuario,
        required this.token,
    });

    AuthResponse copyWith({
        Usuario? usuario,
        String? token,
    }) => 
        AuthResponse(
            usuario: usuario ?? this.usuario,
            token: token ?? this.token,
        );

    factory AuthResponse.fromRawJson(String str) => AuthResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        usuario: Usuario.fromJson(json["usuario"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "usuario": usuario.toJson(),
        "token": token,
    };
}


