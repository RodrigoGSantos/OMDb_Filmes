import 'package:flutter/material.dart';
import 'package:projectomdb/models/Modelo_filmes.dart';

class FilmesTitles extends StatelessWidget {
  final Filmes filmes;

  FilmesTitles(this.filmes);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Image.network(
                filmes.poster,
            ),
          ),
        ],
      ),
    );
  }
}

