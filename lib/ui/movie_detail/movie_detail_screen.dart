import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/data/core/providers/movies_providers.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/movie_detail/widget/movie_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final movieId = ModalRoute.of(context)?.settings.arguments as int?;
    if (movieId == null) {
      return Scaffold(
        body: Center(child: Text('ID do filme não fornecido')),
      );
    }

    final movieDetail = ref.watch(movieDetailProvider(movieId));
    final urlImg = 'https://image.tmdb.org/t/p/w500';
    return Scaffold(
      body: movieDetail.when(
        error: (error, stackTrace) => Text('Erro: $error'),
        loading: () => Center(child: CircularProgressIndicator()),
        data: (data) {
          return CustomScrollView(
            slivers: [
              MovieAppBar(),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 278,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CachedNetworkImage(
                            imageUrl: '$urlImg/${data.posterPath}',
                            imageBuilder: (context, imageProvider) => Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 278,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '${data.releaseDate.year} • ${data.genres?.map((e) => e.name).join(', ')}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Sinopse',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            data.overview,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 30),
                          ExpansionTile(
                            title: Text(
                              'Elenco Principal',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            children: [
                              SizedBox(
                                height: 160,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 40,
                                            backgroundImage: NetworkImage(
                                              'https://i.imgur.com/F3w8U5G.jpeg',
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text('Ator 1'),
                                          Text(
                                            'nome',
                                            style:
                                                AppTextStyles.lightGreyRegular,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 40,
                                            backgroundImage: NetworkImage(
                                              'https://i.imgur.com/F3w8U5G.jpeg',
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text('Ator 2'),
                                          Text(
                                            'nome',
                                            style:
                                                AppTextStyles.lightGreyRegular,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Adicione mais atores conforme necessário
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Avaliação',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '${data.voteAverage?.toStringAsFixed(1)}/5',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
