import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:projectomdb/models/Modelo_filmes.dart';
import 'package:projectomdb/service/api.dart';
import 'dart:async';

class FilmesBloc implements BlocBase{

  Api api;

  List<Filmes> filmes;

  final StreamController<List<Filmes>> _filmesControler = StreamController<List<Filmes>>();
  Stream get outFilmes => _filmesControler.stream;

  final StreamController<String> _searchFilmes = StreamController<String>();
  Sink get inFilmes => _searchFilmes.sink;

  FilmesBloc(){
    api = Api();

    _searchFilmes.stream.listen(_search);
  }

  void _search(String search) async {
    print(search);
    filmes = await api.search(search);
    _filmesControler.sink.add(filmes);
    print(filmes);
  }

  @override
  void dispose() {
    _searchFilmes.close();
    _filmesControler.close();

  }
}