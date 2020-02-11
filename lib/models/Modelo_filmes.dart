class Filmes {

  final String title;
  final String poster;
  final String ID;

  Filmes({this.title, this.poster, this.ID,});

  factory Filmes.fromJson(Map<String, dynamic>json){

    return Filmes(
    title: json["Title"],
    poster: json["Poster"],
    ID: json["imdbID"],
    );

  }

}
  /*GestureDetector(
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Favoritos(); */
/**/