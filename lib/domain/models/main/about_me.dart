import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'education.dart';

part 'about_me.g.dart';

@JsonSerializable()
class AboutMe implements Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String dateOfBirth;
  final String address;
  final String email;
  final String phone;
  final String hobbies;
  final List<Education> education;
  final String pictureLink;
  final String description;
  final String cvLink;

  AboutMe({
    required this.id,
    required this.dateOfBirth,
    required this.address,
    required this.email,
    required this.phone,
    required this.hobbies,
    required this.education,
    required this.pictureLink,
    required this.description,
    required this.cvLink,
  });

  factory AboutMe.fromJson(Map<String, dynamic> json) => _$AboutMeFromJson(json);

  Map<String, dynamic> toJson() => _$AboutMeToJson(this);

  @override
  List<Object?> get props => [
        id,
        address,
        dateOfBirth,
        email,
        phone,
        hobbies,
        education,
        pictureLink,
        description,
        cvLink,
      ];

  @override
  bool? get stringify => true;
}
