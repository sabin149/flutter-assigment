class GetDiscoverPostsModel {
  String? sId;
  String? content;
  List<Images>? images;
  String? user;

  GetDiscoverPostsModel({this.sId, this.content, this.images, this.user});

  GetDiscoverPostsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['content'] = content;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
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
