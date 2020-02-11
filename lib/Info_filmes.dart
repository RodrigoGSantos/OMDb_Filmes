import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'models/Modelo_filmes.dart';

class InfoFilmes extends StatelessWidget {
  final Filmes filmes;

  InfoFilmes(this.filmes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
          )
        ],
        centerTitle: true,
        title: Text(filmes.title),
      ),
    );
  }
}
