import 'package:domain/entities/movie_detail.dart';
import 'package:teste_tokenlab/data/cache/models/movie_cm.dart';
import 'package:teste_tokenlab/data/cache/models/movie_detail_cm.dart';
import 'package:teste_tokenlab/data/remote/models/movie_detail_rm.dart';
import 'package:teste_tokenlab/data/remote/models/movie_rm.dart';

final favoriteIdMoviesTest = <int>[2, 4];

final movieCmTestList = <MovieCm>[
  MovieCm(id: 1, title: 'test1', posterUrl: 'test.com.br'),
  MovieCm(id: 2, title: 'test2', posterUrl: 'test.com.br'),
  MovieCm(id: 3, title: 'test3', posterUrl: 'test.com.br'),
  MovieCm(id: 4, title: 'test4', posterUrl: 'test.com.br'),
];

final movieRmTestList = <MovieRm>[
  MovieRm(id: 1, title: 'test1', posterUrl: 'test.com.br'),
  MovieRm(id: 2, title: 'test2', posterUrl: 'test.com.br'),
  MovieRm(id: 3, title: 'test3', posterUrl: 'test.com.br'),
  MovieRm(id: 4, title: 'test4', posterUrl: 'test.com.br'),
];

final movieDetailRmTest = MovieDetailRm(
  id: 1,
  posterUrl: 'test.com.br',
  title: 'test1Rm',
  genres: ['genres'],
  releaseDate: 'releaseDate',
  originalLanguage: 'originalLanguage',
  voteAverage: 10,
  popularity: 10,
  voteCount: 10,
  imdbId: 'imdbId',
  overview: 'overview',
);

final movieDetailCmTest = MovieDetailCm(
  id: 1,
  posterUrl: 'test.com.br',
  title: 'test1Cm',
  genres: ['genres'],
  releaseDate: 'releaseDate',
  originalLanguage: 'originalLanguage',
  voteAverage: 10,
  popularity: 10,
  voteCount: 10,
  imdbId: 'imdbId',
  overview: 'overview',
);

final movieDetailEntityTest = MovieDetail(
  id: 1,
  posterUrl: 'test.com.br',
  title: 'test1Entity',
  genres: ['genres'],
  releaseDate: 'releaseDate',
  originalLanguage: 'originalLanguage',
  voteAverage: 10,
  popularity: 10,
  voteCount: 10,
  imdbId: 'imdbId',
  overview: 'overview',
);
