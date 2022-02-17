class PostModel {
  String? sId;
  String? content;
  List<Images>? images;
  List<Likes>? likes;
  List<Comments>? comments;
  Likes? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  PostModel(
      {this.sId,
      this.content,
      this.images,
      this.likes,
      this.comments,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.iV});

  PostModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(Likes.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    user = json['user'] != null ? Likes.fromJson(json['user']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['content'] = content;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (likes != null) {
      data['likes'] = likes!.map((v) => v.toJson()).toList();
    }
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Images {
  String? publicId;
  String? url;

  Images({this.publicId, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    publicId = json['public_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['public_id'] = publicId;
    data['url'] = url;
    return data;
  }
}

class Likes {
  String? sId;
  String? fullname;
  String? username;
  String? avatar;
  List<String>? followers;

  Likes({this.sId, this.fullname, this.username, this.avatar, this.followers});

  Likes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = json['fullname'];
    username = json['username'];
    avatar = json['avatar'];
    followers = json['followers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fullname'] = fullname;
    data['username'] = username;
    data['avatar'] = avatar;
    data['followers'] = followers;
    return data;
  }
}

class Comments {
  String? sId;
  String? content;
  List<CommentLikes>? likes;
  CommentLikes? user;
  String? postId;
  String? postUserId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  CommentLikes? tag;
  String? reply;

  Comments(
      {this.sId,
      this.content,
      this.likes,
      this.user,
      this.postId,
      this.postUserId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.tag,
      this.reply});

  Comments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    if (json['likes'] != null) {
      likes = <CommentLikes>[];
      json['likes'].forEach((v) {
        likes!.add(CommentLikes.fromJson(v));
      });
    }
    user = json['user'] != null ? CommentLikes.fromJson(json['user']) : null;
    postId = json['postId'];
    postUserId = json['postUserId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    tag = json['tag'] != null ? CommentLikes.fromJson(json['tag']) : null;
    reply = json['reply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['content'] = content;
    if (likes != null) {
      data['likes'] = likes!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['postId'] = postId;
    data['postUserId'] = postUserId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (tag != null) {
      data['tag'] = tag!.toJson();
    }
    data['reply'] = reply;
    return data;
  }
}

class CommentLikes {
  String? sId;
  String? fullname;
  String? username;
  String? email;
  String? avatar;
  String? role;
  String? gender;
  String? mobile;
  String? address;
  String? story;
  String? website;
  List<String>? followers;
  List<String>? following;
  List<String>? saved;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CommentLikes(
      {this.sId,
      this.fullname,
      this.username,
      this.email,
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

  CommentLikes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = json['fullname'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    role = json['role'];
    gender = json['gender'];
    mobile = json['mobile'];
    address = json['address'];
    story = json['story'];
    website = json['website'];
    followers = json['followers'].cast<String>();
    following = json['following'].cast<String>();
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
    data['avatar'] = avatar;
    data['role'] = role;
    data['gender'] = gender;
    data['mobile'] = mobile;
    data['address'] = address;
    data['story'] = story;
    data['website'] = website;
    data['followers'] = followers;
    data['following'] = following;
    data['saved'] = saved;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
