class Infofilms {

  final String title;
  final String year;
  final String runtime;
  final String director;
  final String plot;
  final String poster;

  Infofilms({this.title, this.year, this.runtime,
    this.director, this.plot, this.poster});

  factory Infofilms.fromJson(Map<String, dynamic>json){

    return Infofilms(
      title: json["Title"],
      year: json["Year"],
      runtime: json["Runtime"],
      director: json["Director"],
      plot: json["Plot"],
      poster: json["Poster"],
    );

  }

}