import 'package:json_annotation/json_annotation.dart';
import "person.dart";
part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  String? name;
  String? email;
  Person? boss;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
