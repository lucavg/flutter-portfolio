// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter_portfolio/model/projects/tech_type.dart';

part 'tech.g.dart';

@JsonSerializable(explicitToJson: true)
class Tech {
  @JsonKey(name: 'id', required: true)
  final int id;
  @JsonKey(name: 'title', required: true, includeIfNull: false)
  final String title;
  @JsonKey(name: 'techType', required: true)
  final TechType techType;

  const Tech({
    required this.id,
    required this.title,
    required this.techType,
  });

  factory Tech.fromJson(Map<String, dynamic> json) => _$TechFromJson(json);

  Map<String, dynamic> toJson() => _$TechToJson(this);

}
