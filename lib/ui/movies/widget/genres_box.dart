import 'package:cinebox/data/core/providers/movies_providers.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenresBox extends ConsumerStatefulWidget {
  const GenresBox({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GenresBoxState();
}

class _GenresBoxState extends ConsumerState<GenresBox> {
  @override
  Widget build(BuildContext context) {
    final genres = ref.watch(genresProvider);
    final selectedGenre = ref.watch(selectedGenreProvider);

    return genres.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text("Erro: $err")),
      data: (genresList) {
        return SizedBox(
          height: 40,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10),
            physics: BouncingScrollPhysics(),
            itemCount: genresList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final genre = genresList[index];
              final isSelected = selectedGenre == genre.id;
              return InkWell(
                onTap: () {
                  final current = ref.read(selectedGenreProvider);
                  ref.read(selectedGenreProvider.notifier).state =
                      current == genre.id ? 0 : genre.id;
                },
                child: Container(
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isSelected ? AppColors.redColor : AppColors.darkGrey,
                  ),
                  child: Center(
                    child: Text(
                      genre.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
