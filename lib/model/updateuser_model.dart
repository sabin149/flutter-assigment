class UpdateUserModel {
  String? sId;
  String? fullname;
  String? username;
  String? email;
  String? avatar;
  String? mobile;
  String? story;
  
  UpdateUserModel({
    this.sId,
    this.fullname,
    this.username,
    this.email,
    this.avatar,
    this.mobile,
    this.story,
    
  });
  

}
  

  // UserModel.fromJson(Map<String, dynamic> json) {
  //   json = json['user'];
  //   sId = json['_id'];
  //   fullname = json['fullname'];
  //   username = json['username'];
  //   email = json['email'];
  //   password = json['password'];
  //   avatar = json['avatar'];

  //   mobile = json['mobile'];

  //   story = json['story'];



  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['_id'] = sId;
  //   data['fullname'] = fullname;
  //   data['username'] = username;
  //   data['email'] = email;

  //   data['avatar'] = avatar;

  //   data['mobile'] = mobile;
  //   data['address'] = address;
  //   data['story'] = story;
   
  //   return data;
  // }



