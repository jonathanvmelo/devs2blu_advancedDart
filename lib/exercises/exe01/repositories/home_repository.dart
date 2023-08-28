import 'dart:convert';

import 'package:flutter_advanced_dart/exercises/exe01/models/person_model.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  static Future<List<PersonModel>> getPerson(int? page) async {
    Uri? uri = null;
    if (page != null) {
      uri = Uri.https("swapi.dev", "/api/people", {
        "page": page.toString(),
      });
    } else {
      uri = Uri.https("swapi.dev", "/api/people", {
        "page": "1",
      });
    }

    http.Response resposta = await http.get(uri);

    if (resposta.statusCode != 200) {
      throw "Erro ao buscar os dados da pessoa: Erro HTTP ${resposta.statusCode}";
    }

    var personList = jsonDecode(resposta.body);

    List<PersonModel> list = [];

    (personList["results"] as List<dynamic>).forEach((element) {
      list.add(PersonModel.fromJson(element));
    });

    return list;
  }
}
