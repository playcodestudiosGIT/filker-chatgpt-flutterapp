import 'dart:convert';

class Escena {
    int numero;
    String textoEscena;

    Escena({
        required this.numero,
        required this.textoEscena,
    });

    factory Escena.fromRawJson(String str) => Escena.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Escena.fromJson(Map<String, dynamic> json) => Escena(
        numero: json["numero"],
        textoEscena: json["texto_escena"],
    );

    Map<String, dynamic> toJson() => {
        "numero": numero,
        "texto_escena": textoEscena,
    };
}


