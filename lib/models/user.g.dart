// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..name = json['name'] as String?
  ..email = json['email'] as String?
  ..boss = json['boss'] == null
      ? null
      : Person.fromJson(json['boss'] as Map<String, dynamic>);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'boss': instance.boss,
    };
