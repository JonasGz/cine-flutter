import 'package:cinebox/data/core/rest_client/tmdb_rest_client_provider.dart';
import 'package:cinebox/data/models/genre_item.dart';
import 'package:cinebox/data/models/movie_detail.dart';
import 'package:cinebox/data/models/movie_item.dart';
import 'package:cinebox/data/repositories/tmdb_repository_impl.dart';
import 'package:cinebox/data/services/tmdb/tmdb_service.dart';
import 'package:cinebox/domain/repositories/tmdb_repository.dart';
import 'package:cinebox/domain/usecases/get_movie_detail_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final tmdbServiceProvider = Provider<TmdbService>((ref) {
  final dio = ref.watch(tmdbRestClientProvider);
  return TmdbService(dio);
});

final tmdbRepositoryProvider = Provider<TmdbRepository>((ref) {
  final tmdbService = ref.watch(tmdbServiceProvider);
  return TmdbRepositoryImpl(tmdbService);
});

final selectedGenreProvider = StateProvider<int>((ref) => 0);

final genresProvider = FutureProvider<List<GenreItem>>((ref) {
  final tmdbRepository = ref.watch(tmdbRepositoryProvider);
  return tmdbRepository.getGenres();
});

final moviesByCategoryProvider = FutureProvider.family<List<MovieItem>, String>(
  (ref, category) {
    final tmdbRepository = ref.watch(tmdbRepositoryProvider);
    return tmdbRepository.getMoviesByCategory(category);
  },
);

final moviesByGenderProvider = FutureProvider.family<List<MovieItem>, int>(
  (ref, genderId) {
    final tmdbRepository = ref.watch(tmdbRepositoryProvider);
    return tmdbRepository.getMoviesByGender(genderId);
  },
);

final searchMoviesProvider = FutureProvider.family<List<MovieItem>, String>((
  ref,
  query,
) {
  final tmdbRepository = ref.read(tmdbRepositoryProvider);
  return tmdbRepository.getMoviesBySearch(query);
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final moviesProvider = FutureProvider<List<MovieItem>>((ref) {
  final tmdbRepository = ref.watch(tmdbRepositoryProvider);
  return tmdbRepository.getAllMovies();
});

final getMovieDetailUsecaseProvider = Provider<GetMovieDetailUsecase>((ref) {
  final tmdbRepository = ref.watch(tmdbRepositoryProvider);
  return GetMovieDetailUsecase(tmdbRepository);
});

final movieDetailProvider = FutureProvider.family<MovieDetail, int>((
  ref,
  movieId,
) {
  final getMovieDetailUsecase = ref.read(getMovieDetailUsecaseProvider);
  return getMovieDetailUsecase(movieId);
});
