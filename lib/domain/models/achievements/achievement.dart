import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'achievement.g.dart';

@JsonSerializable(explicitToJson: true)
class Achievement implements Equatable {
  Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.imageLink,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) => _$AchievementFromJson(json);

  Map<String, dynamic> toJson() => _$AchievementToJson(this);

  @JsonKey(name: 'itemId')
  final String id;

  @JsonKey(name: 'itemTitle')
  final String title;

  @JsonKey(name: 'itemDescription')
  final String description;

  @JsonKey(name: 'itemLink')
  final String imageLink;

  @override
  List<Object?> get props => [id, title, description, imageLink];

  @override
  bool? get stringify => true;
}
