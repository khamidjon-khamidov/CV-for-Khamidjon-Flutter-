import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable(explicitToJson: true)
class Project implements Equatable {
  @JsonKey(name: 'projectId')
  final String id;
  @JsonKey(name: 'projectTime')
  final String time;
  @JsonKey(name: 'projectTitle')
  final String title;
  @JsonKey(name: 'projectDes')
  final String description;
  @JsonKey(name: 'projectLink')
  final String link;
  @JsonKey(name: 'projectGitLink')
  final String gitLink;

  Project({
    required this.id,
    required this.time,
    required this.title,
    required this.description,
    required this.link,
    required this.gitLink,
  });

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  @override
  List<Object?> get props => [id, time, title, description, link, gitLink];

  @override
  bool? get stringify => true;
}
