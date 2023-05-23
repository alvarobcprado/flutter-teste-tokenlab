// Mocks generated by Mockito 5.4.1 from annotations
// in teste_tokenlab/test/presentation/movies/list/favorites_list/favorites_bloc_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:domain/data_repositories/movie_data_repository.dart' as _i2;
import 'package:domain/entities/movie.dart' as _i5;
import 'package:domain/use_cases/get_movie_favorite_list_uc.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeMovieDataRepository_0 extends _i1.SmartFake
    implements _i2.MovieDataRepository {
  _FakeMovieDataRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetMovieFavoriteListUc].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovieFavoriteListUc extends _i1.Mock
    implements _i3.GetMovieFavoriteListUc {
  MockGetMovieFavoriteListUc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieDataRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieDataRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.MovieDataRepository);
  @override
  _i4.Future<List<_i5.Movie>> getRawFuture({required dynamic params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRawFuture,
          [],
          {#params: params},
        ),
        returnValue: _i4.Future<List<_i5.Movie>>.value(<_i5.Movie>[]),
      ) as _i4.Future<List<_i5.Movie>>);
  @override
  _i4.Future<List<_i5.Movie>> getFuture({required dynamic params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFuture,
          [],
          {#params: params},
        ),
        returnValue: _i4.Future<List<_i5.Movie>>.value(<_i5.Movie>[]),
      ) as _i4.Future<List<_i5.Movie>>);
}
