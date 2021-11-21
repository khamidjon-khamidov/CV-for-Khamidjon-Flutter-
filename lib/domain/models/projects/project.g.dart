// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: json['projectId'] as String,
      time: json['projectTime'] as String,
      title: json['projectTitle'] as String,
      description: json['projectDes'] as String,
      link: json['projectLink'] as String,
      gitLink: json['projectGitLink'] as String,
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'projectId': instance.id,
      'projectTime': instance.time,
      'projectTitle': instance.title,
      'projectDes': instance.description,
      'projectLink': instance.link,
      'projectGitLink': instance.gitLink,
    };
