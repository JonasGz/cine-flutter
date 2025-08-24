import 'package:cinebox/data/models/movie_detail.dart';
import 'package:cinebox/domain/repositories/tmdb_repository.dart';

class GetMovieDetailUsecase {
  final TmdbRepository _repository;

  GetMovieDetailUsecase(this._repository);

  Future<MovieDetail> call(int movieId) {
    final movieDetail = _repository.getMovieDetails(movieId);
    return movieDetail;
  }
}
