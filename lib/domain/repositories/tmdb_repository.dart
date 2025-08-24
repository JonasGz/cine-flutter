import 'package:cinebox/data/models/genre_item.dart';
import 'package:cinebox/data/models/movie_detail.dart';
import 'package:cinebox/data/models/movie_item.dart';

abstract class TmdbRepository {
  Future<List<GenreItem>> getGenres();
  Future<List<MovieItem>> getMoviesByCategory(String category);
  Future<List<MovieItem>> getAllMovies();
  Future<List<MovieItem>> getMoviesByGender(int genderId);
  Future<List<MovieItem>> getMoviesBySearch(String query);
  Future<MovieDetail> getMovieDetails(int movieId);
}
