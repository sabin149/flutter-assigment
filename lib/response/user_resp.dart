import '/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_resp.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseUser {
  final bool success;
  final String accesstoken;
  final String msg;
  final List<UserModel> user;

  ResponseUser(
      {required this.user,
      required this.success,
      required this.accesstoken,
      required this.msg});

  factory ResponseUser.fromJson(Map<String, dynamic> json) =>
      _$ResponseUserFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseUserToJson(this);
}
