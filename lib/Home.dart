import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:projectomdb/blocs/bloc_fav.dart';
import 'package:projectomdb/blocs/filmes_bloc.dart';
import 'package:projectomdb/favoritos.dart';
import 'package:projectomdb/models/Modelo_filmes.dart';
import 'package:projectomdb/widgets/filmes_title.dart';
import 'delegates/search.dart';


void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("OMDb Filmes"),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: StreamBuilder<Map<String, Filmes>>(
              stream: BlocProvider.of<FavoritosBloc>(context).outfav,
              builder: (context, snapshot){
                if(snapshot.hasData) return Text("${snapshot.data.length}");
                else return Container();
              },
            ),
          ),
          IconButton(
              icon: Icon(Ionicons.ios_heart
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Favoritos()));
              }
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String result = await showSearch(context: context, delegate: DataSearch());
                if (result != null) BlocProvider.of<FilmesBloc>(context).inFilmes.add(result);
              }
          ),
        ],
      ),
      body: StreamBuilder(
        stream: BlocProvider.of<FilmesBloc>(context).outFilmes,
          builder:(context, snapshot){
          if(snapshot.hasData)
            return ListView.builder(
                itemBuilder: (context, index){
                  return FilmesTitles(snapshot.data[index]);
                },
              itemCount: snapshot.data.length,
            );
          else
            return Container();
          }

      ),
    );
  }
}

/**/