///Model dos filmes obtidos a partir da URL base da api
class MovieModel {
  late int id;
  late double voteAverage;
  late String title;
  late String posterUrl;
  late List<String> genres;
  late String releaseDate;

  MovieModel({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.posterUrl,
    required this.genres,
    required this.releaseDate,
  });

  ///Serialização do JSON para o Model
  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voteAverage = json['vote_average'];
    title = json['title'];
    posterUrl = json['poster_url'];
    genres = json['genres'].cast<String>();
    releaseDate = json['release_date'];
  }

  ///Desserialização do Model para JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vote_average'] = this.voteAverage;
    data['title'] = this.title;
    data['poster_url'] = this.posterUrl;
    data['genres'] = this.genres;
    data['release_date'] = this.releaseDate;
    return data;
  }
}
