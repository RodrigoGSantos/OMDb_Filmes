import 'dart:async';
import 'dart:convert';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:projectomdb/models/Modelo_filmes.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritosBloc implements BlocBase {

  Map<String, Filmes> _favoritos = {};

  final _favController = BehaviorSubject<Map<String, Filmes>>();
  Stream<Map<String, Filmes>> get outfav => _favController.stream;

  Favoritos(){
    SharedPreferences.getInstance().then((prefs){
      if(prefs.getKeys().contains("favoritos")) {
        _favoritos = json.decode(prefs.getString("favoritos")).map((k, v) {
          return MapEntry(k, Filmes.fromJson(v));
        }).cast<String, Filmes>();

        _favController.add(_favoritos);
      }
    });
  }


  void toggleFavoritos(Filmes filmes){
    if(_favoritos.containsKey(filmes.ID))_favoritos.remove(filmes.ID);
    else _favoritos[filmes.ID] = filmes;

    _favController.sink.add(_favoritos);

   _saveFavoritos();
  }

  void _saveFavoritos(){
    SharedPreferences.getInstance().then((prefs){
      prefs.setString("favoritos", json.encode(_favoritos));
    });
  }
  @override
  void dispose() {
    _favController.close();
  }
}