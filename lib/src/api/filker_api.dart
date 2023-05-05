import 'dart:convert';
import 'dart:io';
import 'package:fliker/constants/generales.dart';
import 'package:fliker/src/models/models_model.dart';
import 'package:fliker/src/models/response_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class FilkerApi {
  static Future<List<ModelsModel>> getModels(BuildContext context) async {
    try {
      final resp = await http.get(Uri.parse(Generales.MODELS_URL), headers: {'Authorization': 'Bearer ${Generales.API_KEY}'});
      Map jsonResponse = jsonDecode(resp.body);
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }

      List temp = [];

      for (var value in jsonResponse["data"]) {
        temp.add(value);
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (e) {
      print('error $e');
      rethrow;
    }
  }

  /// peticion request
  static Future<String> sendReq(String message, String genero) async {
    try {
      final resp = await http.post(Uri.parse(Generales.REQ_URL),
          headers: {'Authorization': 'Bearer ${Generales.API_KEY}', 'Content-Type': 'application/json'},
          body: jsonEncode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "user",
                "content":
                    "Genera una sinopsis de genero $genero  con las siguientes palablas: $message. Empieza tu respuesta directo con un titulo bien resaltado, la historia debe tener todas las propiedades de una sinopsis"
              }
            ],
            "max_tokens": 280
          }));
      Map jsonResponse = jsonDecode(const Utf8Decoder().convert(resp.bodyBytes));
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }

      final respObject = ReqResponseModel.fromJson(jsonDecode(const Utf8Decoder().convert(resp.bodyBytes)));
      return respObject.choices[0].message.content;
    } catch (e) {
      print('error $e');
      rethrow;
    }
  }
}
