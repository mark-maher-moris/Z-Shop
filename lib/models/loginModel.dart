class LoginModel {
  bool? status;
  String? message;
  UserData? data;

  LoginModel({
    this.status,
    this.message,
    this.data,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;
  int? credit;
  int? points;
  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.token,
    this.credit,
    this.points,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
    credit = json['credit'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['token'] = token;
    data['credit'] = credit;
    data['points'] = points;
    return data;
  }
}
