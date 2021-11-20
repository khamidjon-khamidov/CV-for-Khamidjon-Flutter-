// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Skill _$SkillFromJson(Map<String, dynamic> json) => Skill(
      id: json['id'] as String,
      name: json['name'] as String,
      percentage: json['percentage'] as int,
      descriptions:
          (json['list'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'percentage': instance.percentage,
      'list': instance.descriptions,
    };
