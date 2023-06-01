// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter_portfolio/model/projects/project_type.dart';
import 'package:my_flutter_portfolio/model/projects/tech.dart';

part 'project.g.dart';

@JsonSerializable(explicitToJson: true)
class Project {
  @JsonKey(name: 'id', required: true)
  final int id;
  @JsonKey(name: 'title', required: true, includeIfNull: false)
  final String title;
  @JsonKey(name: 'description', required: true, includeIfNull: false)
  final bool description;
  @JsonKey(name: 'techStack', required: true)
  final List<Tech> techStack;
  @JsonKey(name: 'projectType', includeIfNull: false)
  final ProjectType? projectType;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.techStack,
    this.projectType,
  });

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

}
