class UserModel {
  int? id;
  String? name;
  String? email;
  String? username;
  String? urlPhoto;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.urlPhoto,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    urlPhoto = json['profile_photo_url'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['username'] = username;
    data['profile_photo_url'] = urlPhoto;
    data['token'] = token;

    if (id == null) {
      map['id'] = id;
    }
    return map;
  }
}
