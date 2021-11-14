// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_me.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutMe _$AboutMeFromJson(Map<String, dynamic> json) => AboutMe(
      id: json['_id'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      address: json['address'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      hobbies: json['hobbies'] as String,
      education: (json['education'] as List<dynamic>)
          .map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList(),
      pictureLink: json['pictureLink'] as String,
      description: json['description'] as String,
      cvLink: json['cvLink'] as String,
    );

Map<String, dynamic> _$AboutMeToJson(AboutMe instance) => <String, dynamic>{
      '_id': instance.id,
      'dateOfBirth': instance.dateOfBirth,
      'address': instance.address,
      'email': instance.email,
      'phone': instance.phone,
      'hobbies': instance.hobbies,
      'education': instance.education.map((e) => e.toJson()).toList(),
      'pictureLink': instance.pictureLink,
      'description': instance.description,
      'cvLink': instance.cvLink,
    };
