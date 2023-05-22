import 'dart:convert';

import '../constants/generales.dart';

class Usuario {
    String rol;
    bool estado;
    bool google;
    String nombre;
    String apellido;
    String correo;
    String img;
    String uid;

    Usuario({
        required this.rol,
        required this.estado,
        required this.google,
        required this.nombre,
        required this.apellido,
        required this.correo,
        required this.img,
        required this.uid,
    });

    Usuario copyWith({
        String? rol,
        bool? estado,
        bool? google,
        String? nombre,
        String? apellido,
        String? correo,
        String? img,
        String? uid,
    }) => 
        Usuario(
            rol: rol ?? this.rol,
            estado: estado ?? this.estado,
            google: google ?? this.google,
            nombre: nombre ?? this.nombre,
            apellido: apellido ?? this.apellido,
            correo: correo ?? this.correo,
            img: img ?? Generales.noImage,
            uid: uid ?? this.uid,
        );

    factory Usuario.fromRawJson(String str) => Usuario.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        rol: json["rol"],
        estado: json["estado"],
        google: json["google"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
        img: json["img"],
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "rol": rol,
        "estado": estado,
        "google": google,
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
        "uid": uid,
    };
}