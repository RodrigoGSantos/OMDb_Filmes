import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectomdb/models/Modelo_filmes.dart';
import 'dart:async';

class Api{

  search(String search) async {
  http.Response response = await http.get(
      "http://www.omdbapi.com/?s=$search&type=movie&apikey=23e83391");

  return decode(response);

  }

  List<Filmes> decode(http.Response response){

    if(response.statusCode == 200){

      var decoded = json.decode(response.body);

      List<Filmes> filmes = decoded["Search"].map<Filmes>(
          (map){
            return Filmes.fromJson(map);
          }
      ).toList();

      return filmes;

    }else{

      throw Exception("Falha ao carregar Filmes");
    }
  }
}

