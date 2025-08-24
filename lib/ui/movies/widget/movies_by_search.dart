import 'package:cinebox/data/core/providers/movies_providers.dart';
import 'package:cinebox/ui/movies/widget/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesBySearch extends ConsumerStatefulWidget {
  const MoviesBySearch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesBySearchState();
}

class _MoviesBySearchState extends ConsumerState<MoviesBySearch> {
  @override
  Widget build(BuildContext context) {
    final query = ref.watch(searchQueryProvider);
    final searchResults = ref.watch(searchMoviesProvider(query));

    return Container(
      margin: EdgeInsets.only(bottom: 130),
      child: MoviesBox(
        title: 'Filmes encontrados na busca',
        vertical: true,
        movies: searchResults.when(
          data: (movies) => movies,
          loading: () => [],
          error: (error, stack) => [],
        ),
      ),
    );
  }
}
