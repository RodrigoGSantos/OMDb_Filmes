import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:projectomdb/models/Modelo_filmes.dart';
import 'blocs/bloc_fav.dart';

class Favoritos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavoritosBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<Map<String, Filmes>>(
        stream: bloc.outfav,
        initialData: {},
        builder: (context, snapshot) {
          return ListView(
            children: snapshot.data.values.map((v) {
              return InkWell(
                onTap: (){

                },
                onLongPress: (){
                  bloc.toggleFavoritos(v);
              },
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: 120  ,
                      height: 150,
                      child: Image.network(v.poster),
                    ),
                    Expanded(
                        child: Text(
                      v.title,
                      maxLines: 2,
                    ))
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
