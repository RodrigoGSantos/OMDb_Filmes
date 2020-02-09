import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:projectomdb/blocs/filmes_bloc.dart';
import 'package:projectomdb/service/api.dart';
import 'Home.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: FilmesBloc(),
      child:  MaterialApp(
        title: "OMDb Filmes",
        home: Home(),
      ),
    );
  }
}
