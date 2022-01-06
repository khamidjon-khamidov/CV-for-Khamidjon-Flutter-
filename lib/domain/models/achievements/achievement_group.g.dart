// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AchievementGroup _$AchievementGroupFromJson(Map<String, dynamic> json) =>
    AchievementGroup(
      id: json['listId'] as String,
      title: json['listTitle'] as String,
      achievements: (json['hList'] as List<dynamic>)
          .map((e) => Achievement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AchievementGroupToJson(AchievementGroup instance) =>
    <String, dynamic>{
      'listId': instance.id,
      'listTitle': instance.title,
      'hList': instance.achievements.map((e) => e.toJson()).toList(),
    };
