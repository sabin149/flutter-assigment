class GetUserPostsModel {
  String? sId;
  String? content;
  List<Images>? images;
  List<String>? likes;
  List<String>? comments;
  String? user;


  GetUserPostsModel(
      {this.sId,
      this.content,
      this.images,
      this.likes,
      this.comments,
      this.user,
 });

  GetUserPostsModel.fromJson(Map<String, dynamic> json) {
//  print(json[1]);
    sId = json['_id'];
    content = json['content'];
   
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      }); 
    }
    likes = json['likes'].cast<String>();
   
    comments = json['comments'].cast<String>();  
    user = json['user'];
   
    // createdAt = json['createdAt']; 
    // updatedAt = json['updatedAt'];
    // iV = json['__v'];
  } 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['content'] = content;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['likes'] = likes;
    data['comments'] = comments;
    data['user'] = user;

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
