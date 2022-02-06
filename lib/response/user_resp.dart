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


 // factory named constructor -> when we have json map, json map bhayako bela matrai hamilae define gareko dart class  ko object banune bela yo method call huncha   

 // mathi ko factory named constructor->>>>>> jab tyo constructor sanga json ko object cha ra json ko object bata ResponseUser class ko object banune ho bhane matrai tyo bela ma yo constructor call huncha.  