// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tech.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tech _$TechFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'title', 'techType'],
  );
  return Tech(
    id: json['id'] as int,
    title: json['title'] as String,
    techType: $enumDecode(_$TechTypeEnumMap, json['techType']),
  );
}

Map<String, dynamic> _$TechToJson(Tech instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'techType': _$TechTypeEnumMap[instance.techType]!,
    };

const _$TechTypeEnumMap = {
  TechType.flutter: 'Flutter',
  TechType.java: 'Java',
};
