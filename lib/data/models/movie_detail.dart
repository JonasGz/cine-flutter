import 'package:cinebox/data/models/genre_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetail {
  final int id;
  final String title;
  final String overview;
  final List<GenreItem>? genres;
  final String? posterPath;
  final String? backdropPath;
  final double? voteAverage;
  final DateTime releaseDate;

  MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    this.genres,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}
