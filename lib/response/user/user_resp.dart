class ResponseUser {
  bool? success;
  String? token;
  String? msg;

  ResponseUser({this.success, this.token, this.msg});

  factory ResponseUser.fromJson(Map<String, dynamic> json) {
    return ResponseUser(
      success: json['success'],
      token: json['token'],
      msg: json['msg'],
    );
  }
}
