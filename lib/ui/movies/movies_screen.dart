import 'package:cinebox/data/core/providers/movies_providers.dart';
import 'package:cinebox/ui/movies/widget/genres_box.dart';
import 'package:cinebox/ui/movies/widget/movies_appbar.dart';
import 'package:cinebox/ui/movies/widget/movies_by_category.dart';
import 'package:cinebox/ui/movies/widget/movies_by_gender.dart';
import 'package:cinebox/ui/movies/widget/movies_by_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesScreen extends ConsumerStatefulWidget {
  const MoviesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends ConsumerState<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedGenre = ref.watch(selectedGenreProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    return CustomScrollView(
      slivers: [
        MoviesAppBar(),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 22),
            child: GenresBox(),
          ),
        ),
        SliverToBoxAdapter(
          child: searchQuery.isNotEmpty
              ? MoviesBySearch()
              : selectedGenre == 0
              ? MoviesByCategory()
              : MoviesByGender(),
        ),
      ],
    );
  }
}
