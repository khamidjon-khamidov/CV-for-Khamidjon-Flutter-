import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'achievement.dart';

part 'achievement_group.g.dart';

@JsonSerializable(explicitToJson: true)
class AchievementGroup implements Equatable {
  AchievementGroup({
    required this.id,
    required this.title,
    required this.achievements,
  });

  factory AchievementGroup.fromJson(Map<String, dynamic> json) => _$AchievementGroupFromJson(json);

  Map<String, dynamic> toJson() => _$AchievementGroupToJson(this);

  @JsonKey(name: 'listId')
  final String id;

  @JsonKey(name: 'listTitle')
  final String title;

  @JsonKey(name: 'hList')
  final List<Achievement> achievements;

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
