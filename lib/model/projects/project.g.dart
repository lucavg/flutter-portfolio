// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'title', 'description', 'techStack'],
  );
  return Project(
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as bool,
    techStack: (json['techStack'] as List<dynamic>)
        .map((e) => Tech.fromJson(e as Map<String, dynamic>))
        .toList(),
    projectType: $enumDecodeNullable(_$ProjectTypeEnumMap, json['projectType']),
  );
}

Map<String, dynamic> _$ProjectToJson(Project instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
    'description': instance.description,
    'techStack': instance.techStack.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('projectType', _$ProjectTypeEnumMap[instance.projectType]);
  return val;
}

const _$ProjectTypeEnumMap = {
  ProjectType.mobile: 'Mobile',
  ProjectType.web: 'Web',
  ProjectType.fullStack: 'FullStack',
  ProjectType.backend: 'backend',
  ProjectType.frontend: 'frontend',
};
