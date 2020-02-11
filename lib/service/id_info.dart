import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectomdb/models/modelo_infofilms.dart';

class InfoIdFilmes {

  Informacoes(String id) async {
    var response = await http
        .get("http://www.omdbapi.com/?i=$id&type=movie&apikey=23e83391");

    var data = json.decode(response.body);

    return data;
  }

  List<Infofilms> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      List<Infofilms> infilmes = decoded["Search"].map<Infofilms>((map) {
        return Infofilms.fromJson(map);
      }).toList();

      return infilmes;
    } else {
      throw Exception("Falha ao carregar Dados");
    }
  }
}
