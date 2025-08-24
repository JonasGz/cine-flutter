import 'package:cinebox/data/core/providers/movies_providers.dart';
import 'package:cinebox/ui/movies/widget/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesByCategory extends ConsumerStatefulWidget {
  const MoviesByCategory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MoviesByCategoryState();
}

class _MoviesByCategoryState extends ConsumerState<MoviesByCategory> {
  @override
  Widget build(BuildContext context) {
    final popularMovies = ref.watch(moviesByCategoryProvider('popular'));
    final topRatedMovies = ref.watch(moviesByCategoryProvider('top_rated'));
    final nowPlayingMovies = ref.watch(moviesByCategoryProvider('now_playing'));
    final upcomingMovies = ref.watch(moviesByCategoryProvider('upcoming'));

    return Container(
      margin: EdgeInsets.only(bottom: 130),
      child: Column(
        children: [
          popularMovies.when(
            data: (data) => MoviesBox(
              title: 'Mais Populares',
              movies: data,
            ),
            error: (error, stackTrace) => Text('Erro: $error'),
            loading: () => CircularProgressIndicator(),
          ),
          topRatedMovies.when(
            data: (data) => MoviesBox(
              title: 'Top Filmes',
              movies: data,
            ),
            error: (error, stackTrace) => Text('Erro: $error'),
            loading: () => CircularProgressIndicator(),
          ),
          nowPlayingMovies.when(
            data: (data) => MoviesBox(
              title: 'Em Cartaz',
              movies: data,
            ),
            error: (error, stackTrace) => Text('Erro: $error'),
            loading: () => CircularProgressIndicator(),
          ),
          upcomingMovies.when(
            data: (data) => MoviesBox(
              title: 'Próximos Lançamentos',
              movies: data,
            ),
            error: (error, stackTrace) => Text('Erro: $error'),
            loading: () => CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
