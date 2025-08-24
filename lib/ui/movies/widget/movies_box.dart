import 'package:cinebox/data/models/movie_item.dart';
import 'package:cinebox/ui/core/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class MoviesBox extends StatelessWidget {
  final String title;
  final bool vertical;
  final List<MovieItem> movies;

  const MoviesBox({
    super.key,
    required this.title,
    this.vertical = false,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 32, bottom: 24),
          child: Text(
            title,
            style:
                Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.start,
          ),
        ),
        Visibility(
          visible: !vertical,
          replacement: Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              runAlignment: WrapAlignment.center,
              children: List.generate(movies.length, (index) {
                return MovieCard(
                  title: movies[index].title,
                  year: movies[index].releaseDate?.split('-').first ?? '2023',
                  img: movies[index].posterPath ?? '',
                );
              }),
            ),
          ),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 280,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 16, left: 20),
                  child: MovieCard(
                    title: movies[index].title,
                    year: movies[index].releaseDate?.split('-').first ?? '2023',
                    img: movies[index].posterPath ?? '',
                  ),
                );
              },
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
