import 'package:dio/dio.dart';
import 'package:teste_tokenlab/app/models/movie_model.dart';

///Repository do acesso a URL base da lista de filmes na API
class MovieRepository {
  final dio = Dio();
  final baseUrl = 'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies';

  Future fetchMovies() async {
    try {
      final response = await dio.get(baseUrl);
      final responseData = response.data as List;

      List<MovieModel> listMovies = responseData.map((movieJson) {
        return MovieModel.fromJson(movieJson);
      }).toList();
      return listMovies;
    } catch (e) {
      throw Exception();
    }
  }
}
