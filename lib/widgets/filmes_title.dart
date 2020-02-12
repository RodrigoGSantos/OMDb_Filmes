import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:projectomdb/Info_filmes.dart';
import 'package:projectomdb/blocs/bloc_fav.dart';
import 'package:projectomdb/models/Modelo_filmes.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../favoritos.dart';

class FilmesTitles extends StatelessWidget {

  final Filmes filmes;

  FilmesTitles(this.filmes);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavoritosBloc>(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InfoFilmes(filmes)));
              },
              child: Container(
                color: Colors.white,
                child: Image.network(
                  filmes.poster,
                  height: 190,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        filmes.title,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<Map<String, Filmes>>(
                stream: bloc.outfav,
                initialData: {},
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return IconButton(
                        icon: Icon(snapshot.data.containsKey(filmes.ID)
                            ? Ionicons.ios_heart
                            : Ionicons.ios_heart_empty),
                        iconSize: 20,
                        onPressed: () {
                          bloc.toggleFavoritos(filmes);
                        }
                    );
                  else
                    return CircularProgressIndicator();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
