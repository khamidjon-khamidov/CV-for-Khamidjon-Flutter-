import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'skill.g.dart';

@JsonSerializable(explicitToJson: true)
class Skill implements Equatable {
  final String id;
  final String name;
  final int percentage;
  @JsonKey(name: 'list')
  final List<String> descriptions;

  Skill({
    required this.id,
    required this.name,
    required this.percentage,
    required this.descriptions,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  Map<String, dynamic> toJson() => _$SkillToJson(this);

  @override
  List<Object?> get props => [id, name, percentage, descriptions];

  @override
  bool? get stringify => true;
}
