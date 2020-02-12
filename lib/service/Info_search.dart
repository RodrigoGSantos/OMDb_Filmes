import 'dart:convert';
import 'package:http/http.dart' as http;

class InfoFilme {

  getDetails(String id) async {

    var response =
    await http.get('http://www.omdbapi.com/?i=$id&apikey=23e83391');

    var data = json.decode(response.body);

    return data;
  }
}
