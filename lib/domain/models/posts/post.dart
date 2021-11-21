import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
class Post implements Equatable {
  @JsonKey(name: 'postId')
  final String id;
  @JsonKey(name: 'postDescription')
  final String title;
  @JsonKey(name: 'postLink')
  final String link;

  Post({
    required this.id,
    required this.title,
    required this.link,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  List<Object?> get props => [id, title, link];

  @override
  bool? get stringify => true;
}
