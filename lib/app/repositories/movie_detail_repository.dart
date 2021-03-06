import 'package:dio/dio.dart';
import 'package:teste_tokenlab/app/models/movie_detail_model.dart';

///Repository do acesso ao URL específico de cada filme na API
class MovieDetailRepository {
  final dio = Dio();
  final baseUrl = 'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies';

  Future fetchMovieDetail(int movieId) async {
    try {
      final response = await dio.get(baseUrl + "/$movieId");
      final responseData = response.data;

      final MovieDetailModel detailMovie =
          MovieDetailModel.fromJson(responseData);
      return detailMovie;
    } catch (e) {
      throw Exception();
    }
  }
}
