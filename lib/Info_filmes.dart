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
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(filmes.title),
      ),
      body:
      Container(
      color: Colors.white,
    child: Image.network(
    filmes.poster,
    height: 500,
      width: 600,
    ),
    ),
    );
  }
}
