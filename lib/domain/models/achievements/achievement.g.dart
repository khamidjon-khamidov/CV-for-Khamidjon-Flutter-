// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Achievement _$AchievementFromJson(Map<String, dynamic> json) => Achievement(
      id: json['itemId'] as String,
      title: json['itemTitle'] as String,
      description: json['itemDescription'] as String,
      imageLink: json['itemLink'] as String,
    );

Map<String, dynamic> _$AchievementToJson(Achievement instance) =>
    <String, dynamic>{
      'itemId': instance.id,
      'itemTitle': instance.title,
      'itemDescription': instance.description,
      'itemLink': instance.imageLink,
    };
