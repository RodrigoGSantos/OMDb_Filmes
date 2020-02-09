class Filmes {

  final String title;
  final String poster;
  final String ID;

  Filmes({this.title, this.poster, this.ID});

  factory Filmes.fromJson(Map<String, dynamic>json){

    return Filmes(
    title: json["title"],
    poster: json["Poster"],
    ID: json["imdbID"],
    );
  }

}