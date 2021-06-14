class MovieDetailModel {
  late String imdbId;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late double popularity;
  late int voteCount;

  MovieDetailModel({
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.voteCount,
  });

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imdb_id'] = this.imdbId;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['vote_count'] = this.voteCount;
    return data;
  }
}
