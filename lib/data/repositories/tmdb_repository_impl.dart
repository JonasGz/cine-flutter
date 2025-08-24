import 'package:cinebox/core/exceptions/app_exceptions.dart';
import 'package:cinebox/data/models/genre_item.dart';
import 'package:cinebox/data/models/movie_detail.dart';
import 'package:cinebox/data/models/movie_item.dart';
import 'package:cinebox/data/services/tmdb/tmdb_service.dart';
import 'package:cinebox/domain/repositories/tmdb_repository.dart';
import 'package:dio/dio.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final TmdbService _tmdbService;

  TmdbRepositoryImpl(this._tmdbService);

  @override
  Future<List<GenreItem>> getGenres() async {
    try {
      final response = await _tmdbService.getMovieGenres();
      return response.genres;
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw ServerException('Erro ao buscar gêneros: $e');
    }
  }

  @override
  Future<List<MovieItem>> getMoviesByCategory(String category) async {
    switch (category) {
      case 'popular':
        try {
          final response = await _tmdbService.getPopularMovies();
          return response.results;
        } on DioException catch (e) {
          throw _handleDioException(e);
        } catch (e) {
          throw ServerException('Erro ao buscar filmes: $e');
        }
      case 'top_rated':
        try {
          final response = await _tmdbService.getTopRatedMovies();
          return response.results;
        } on DioException catch (e) {
          throw _handleDioException(e);
        } catch (e) {
          throw ServerException('Erro ao buscar filmes: $e');
        }
      case 'now_playing':
        try {
          final response = await _tmdbService.getNowPlayingMovies();
          return response.results;
        } on DioException catch (e) {
          throw _handleDioException(e);
        } catch (e) {
          throw ServerException('Erro ao buscar filmes: $e');
        }
      case 'upcoming':
        try {
          final response = await _tmdbService.getUpcomingMovies();
          return response.results;
        } on DioException catch (e) {
          throw _handleDioException(e);
        } catch (e) {
          throw ServerException('Erro ao buscar filmes: $e');
        }
      default:
        throw Exception('Categoria não suportada: $category');
    }
  }

  @override
  Future<List<MovieItem>> getAllMovies() async {
    try {
      final response = await _tmdbService.getDiscoverMovies();
      return response.results;
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw ServerException('Erro ao buscar filmes: $e');
    }
  }

  @override
  Future<List<MovieItem>> getMoviesByGender(int genderId) async {
    try {
      final response = await _tmdbService.getDiscoverMovies(
        withGenres: genderId.toString(),
      );
      return response.results;
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw ServerException('Erro ao buscar filmes: $e');
    }
  }

  @override
  Future<List<MovieItem>> getMoviesBySearch(String query) async {
    try {
      final response = await _tmdbService.getMoviesBySearch(query: query);
      return response.results;
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw ServerException('Erro ao buscar filmes: $e');
    }
  }

  @override
  Future<MovieDetail> getMovieDetails(int movieId) async {
    try {
      final response = await _tmdbService.getMovieDetails(movieId: movieId);
      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw ServerException('Erro ao buscar detalhes do filme: $e');
    }
  }

  AppException _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException(
          'Tempo limite esgotado. Verifique sua conexão.',
        );

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        switch (statusCode) {
          case 400:
            return const ServerException('Requisição inválida.');
          case 401:
            return const UnauthorizedException('Token de acesso inválido.');
          case 404:
            return const NotFoundException('Recurso não encontrado.');
          case 429:
            return const ServerException(
              'Muitas requisições. Tente novamente mais tarde.',
            );
          case 500:
          case 502:
          case 503:
            return const ServerException('Erro interno do servidor.');
          default:
            return ServerException('Erro do servidor: $statusCode');
        }

      case DioExceptionType.cancel:
        return const NetworkException('Requisição cancelada.');

      case DioExceptionType.connectionError:
        return const NetworkException(
          'Erro de conexão. Verifique sua internet.',
        );

      default:
        return ServerException('Erro de rede: ${e.message}');
    }
  }
}
