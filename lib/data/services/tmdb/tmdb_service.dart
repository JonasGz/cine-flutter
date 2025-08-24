import 'package:cinebox/data/models/genre_response.dart';
import 'package:cinebox/data/models/movie_detail.dart';
import 'package:cinebox/data/models/movie_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'tmdb_service.g.dart';

@RestApi()
abstract class TmdbService {
  factory TmdbService(Dio dio, {String baseUrl}) = _TmdbService;

  @GET('/discover/movie')
  Future<MovieResponse> getDiscoverMovies({
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
    @Query('with_genres') String withGenres = '',
  });

  @GET('/genre/movie/list')
  Future<GenreResponse> getMovieGenres({
    @Query('language') String language = 'pt-BR',
  });

  @GET('/movie/popular')
  Future<MovieResponse> getPopularMovies({
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
  });

  @GET('/movie/top_rated')
  Future<MovieResponse> getTopRatedMovies({
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
  });

  @GET('/movie/now_playing')
  Future<MovieResponse> getNowPlayingMovies({
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
  });

  @GET('/movie/upcoming')
  Future<MovieResponse> getUpcomingMovies({
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
  });

  @GET('/search/movie')
  Future<MovieResponse> getMoviesBySearch({
    @Query('query') required String query,
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
  });

  @GET('/movie/{movie_id}')
  Future<MovieDetail> getMovieDetails({
    @Path('movie_id') required int movieId,
    @Query('language') String language = 'pt-BR',
  });
}
