import 'package:json_annotation/json_annotation.dart';

part 'genre_item.g.dart';

@JsonSerializable()
class GenreItem {
  final int id;
  final String name;

  GenreItem({required this.id, required this.name});

  factory GenreItem.fromJson(Map<String, dynamic> json) =>
      _$GenreItemFromJson(json);

  Map<String, dynamic> toJson() => _$GenreItemToJson(this);
}
