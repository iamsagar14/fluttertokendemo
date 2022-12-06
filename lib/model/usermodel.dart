/// response : true
/// msg : ""
/// result : {"token":"2d844a576aa3b061603ad13c6786a8d93910b41a","user":{"first_name":"Suman","last_name":"Dhital","username":"sumanDtl","profile_picture":"http://gymdemo.ashokfitness.com/media/member/22/12/pic_Mgo51zq.png"},"image":"http://gymdemo.ashokfitness.com/media/site/logo1.png"}

class Usermodel {
  Usermodel({
    bool? response,
    String? msg,
    Result? result,
  }) {
    _response = response;
    _msg = msg;
    _result = result;
  }

  Usermodel.fromJson(dynamic json) {
    _response = json['response'];
    _msg = json['msg'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  bool? _response;
  String? _msg;
  Result? _result;
  Usermodel copyWith({
    bool? response,
    String? msg,
    Result? result,
  }) =>
      Usermodel(
        response: response ?? _response,
        msg: msg ?? _msg,
        result: result ?? _result,
      );
  bool? get response => _response;
  String? get msg => _msg;
  Result? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = _response;
    map['msg'] = _msg;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    return map;
  }
}

/// token : "2d844a576aa3b061603ad13c6786a8d93910b41a"
/// user : {"first_name":"Suman","last_name":"Dhital","username":"sumanDtl","profile_picture":"http://gymdemo.ashokfitness.com/media/member/22/12/pic_Mgo51zq.png"}
/// image : "http://gymdemo.ashokfitness.com/media/site/logo1.png"

class Result {
  Result({
    String? token,
    User? user,
    String? image,
  }) {
    _token = token;
    _user = user;
    _image = image;
  }

  Result.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _image = json['image'];
  }
  String? _token;
  User? _user;
  String? _image;
  Result copyWith({
    String? token,
    User? user,
    String? image,
  }) =>
      Result(
        token: token ?? _token,
        user: user ?? _user,
        image: image ?? _image,
      );
  String? get token => _token;
  User? get user => _user;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['image'] = _image;
    return map;
  }
}

/// first_name : "Suman"
/// last_name : "Dhital"
/// username : "sumanDtl"
/// profile_picture : "http://gymdemo.ashokfitness.com/media/member/22/12/pic_Mgo51zq.png"

class User {
  User({
    String? firstName,
    String? lastName,
    String? username,
    String? profilePicture,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _username = username;
    _profilePicture = profilePicture;
  }

  User.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _username = json['username'];
    _profilePicture = json['profile_picture'];
  }
  String? _firstName;
  String? _lastName;
  String? _username;
  String? _profilePicture;
  User copyWith({
    String? firstName,
    String? lastName,
    String? username,
    String? profilePicture,
  }) =>
      User(
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        username: username ?? _username,
        profilePicture: profilePicture ?? _profilePicture,
      );
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get username => _username;
  String? get profilePicture => _profilePicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['username'] = _username;
    map['profile_picture'] = _profilePicture;
    return map;
  }
}
