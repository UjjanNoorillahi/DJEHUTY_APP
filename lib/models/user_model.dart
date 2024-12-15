// class UserModel {
//   User? user;
//   String? accessToken;
//   String? roleName;
//   bool? isLogin;
//
//
//
//   UserModel({this.user, this.accessToken, this.roleName, this.isLogin});
//
//   UserModel.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//     accessToken = json['accessToken'];
//     roleName = json['refreshToken'];
//     isLogin = json['isLogin'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     data['accessToken'] = accessToken;
//     data['refreshToken'] = roleName;
//     data['isLogin'] = isLogin;
//     return data;
//   }
//
//


class UserModel {
  User? user;
  String? token;
  String? roleName;
  bool? isLogin;

  UserModel({this.user, this.token, this.roleName, this.isLogin});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['data'] != null ? User.fromJson(json['data']) : null;
    token = json['data']?['token'];
    roleName = json['data']?['roleName'];
    isLogin = json['status'] == "success";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    data['roleName'] = roleName;
    data['isLogin'] = isLogin;
    return data;
  }
}






class User {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? username;
  String? screen;

  User({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.username,
    this.screen,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['userId'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    username = json['username'];
    screen = json['screen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['username'] = username;
    data['screen'] = screen;
    return data;
  }
}





































//
// class User {
//   String?   id;
//   Avatar? avatar;
//   String? username;
//   String? email;
//   String? role;
//   String? loginType;
//   bool? isEmailVerified;
//   String? createdAt;
//   String? updatedAt;
//   int? v;
//
//   User(
//       {this.id,
//         this.avatar,
//         this.username,
//         this.email,
//         this.role,
//         this.loginType,
//         this.isEmailVerified,
//         this.createdAt,
//         this.updatedAt,
//         this.v});
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['_id'];
//     avatar =
//     json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
//     username = json['username'];
//     email = json['email'];
//     role = json['role'];
//     loginType = json['loginType'];
//     isEmailVerified = json['isEmailVerified'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     v = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = id;
//     if (avatar != null) {
//       data['avatar'] = avatar!.toJson();
//     }
//     data['username'] = username;
//     data['email'] = email;
//     data['role'] = role;
//     data['loginType'] = loginType;
//     data['isEmailVerified'] = isEmailVerified;
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     data['__v'] = v;
//     return data;
//   }
// }
//
// class Avatar {
//   String? url;
//   String? localPath;
//   String? id;
//
//   Avatar({this.url, this.localPath, this.id});
//
//   Avatar.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     localPath = json['localPath'];
//     id = json['_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['url'] = url;
//     data['localPath'] = localPath;
//     data['_id'] = id;
//     return data;
//   }
// }
