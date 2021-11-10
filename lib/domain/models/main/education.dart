import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'education.g.dart';

@JsonSerializable()
class Education implements Equatable {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'link')
  final String link;

  Education({
    required this.name,
    required this.link,
  });

  factory Education.fromJson(Map<String, dynamic> json) => _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);

  @override
  List<Object?> get props => [name, link];

  @override
  bool? get stringify => true;
}
