import 'dart:convert';

import 'escena_model.dart';

class Proyecto {
    List<Escena> escenas;
    String id;
    String titulo;
    String sinopsis;
    String usuario;

    Proyecto({
        required this.escenas,
        required this.id,
        required this.titulo,
        required this.sinopsis,
        required this.usuario,
    });

    factory Proyecto.fromRawJson(String str) => Proyecto.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Proyecto.fromJson(Map<String, dynamic> json) => Proyecto(
        escenas: List<Escena>.from(json["escenas"].map((x) => Escena.fromJson(x))),
        id: json["_id"],
        titulo: json["titulo"],
        sinopsis: json["sinopsis"],
        usuario: json["usuario"],
    );

    Map<String, dynamic> toJson() => {
        "escenas": List<dynamic>.from(escenas.map((x) => x.toJson())),
        "_id": id,
        "titulo": titulo,
        "sinopsis": sinopsis,
        "usuario": usuario,
    };
}