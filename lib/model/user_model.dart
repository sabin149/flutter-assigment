class UserModel {
  String? sId;
  String? fullname;
  String? username;
  String? email;
  String? password; 
  String? avatar;
  String? role;
  String? gender;
  String? mobile;
  String? address;
  String? story;
  String? website;
  List<Followers>? followers;
  List<Following>? following;
  List<String>? saved;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserModel(
      {this.sId,
      this.fullname,
      this.username,
      this.email,
      this.password,
      this.avatar,
      this.role,
      this.gender,
      this.mobile,
      this.address,
      this.story,
      this.website,
      this.followers,
      this.following,
      this.saved,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = json['fullname'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    avatar = json['avatar'];
    role = json['role'];
    gender = json['gender'];
    mobile = json['mobile'];
    address = json['address'];
    story = json['story'];
    website = json['website'];
    if (json['followers'] != null) {
      followers = <Followers>[];
      json['followers'].forEach((v) {
        followers!.add(Followers.fromJson(v));
      });
    }
    if (json['following'] != null) {
      following = <Following>[];
      json['following'].forEach((v) {
        following!.add(Following.fromJson(v));
      });
    }
    saved = json['saved'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fullname'] = fullname;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['avatar'] = avatar;
    data['role'] = role;
    data['gender'] = gender;
    data['mobile'] = mobile;
    data['address'] = address;
    data['story'] = story;
    data['website'] = website;
    if (followers != null) {
      data['followers'] = followers!.map((v) => v.toJson()).toList();
    }
    if (following != null) {
      data['following'] = following!.map((v) => v.toJson()).toList();
    }
    data['saved'] = saved;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Followers {
  String? sId;
  String? fullname;
  String? username;
  String? avatar;
  List<String>? followers;
  List<String>? following;

  Followers(
      {this.sId,
      this.fullname,
      this.username,
      this.avatar,
      this.followers,
      this.following});

  Followers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = json['fullname'];
    username = json['username'];
    avatar = json['avatar'];
    followers = json['followers'].cast<String>();
    following = json['following'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['fullname'] = fullname;
    data['username'] = username;
    data['avatar'] = avatar;
    data['followers'] = followers;
    data['following'] = following;
    return data;
  }
}

class Following {
  String? sId;
  String? fullname;
  String? username;
  String? avatar;
  List<String>? followers;
  List<String>? following;

  Following(
      {this.sId,
      this.fullname,
      this.username,
      this.avatar,
      this.followers,
      this.following});

  Following.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = json['fullname'];
    username = json['username'];
    avatar = json['avatar'];
    followers = json['followers'].cast<String>();
    following = json['following'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fullname'] = fullname;
    data['username'] = username;
    data['avatar'] = avatar;
    data['followers'] = followers;
    data['following'] = following;
    return data;
  }
}
