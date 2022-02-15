import 'package:frontend/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'getuser_resp.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseGetUser{
  final List<UserModel> user;

  ResponseGetUser({
    required this.user,
  });
  
  factory ResponseGetUser.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetUserFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGetUserToJson(this);
}


