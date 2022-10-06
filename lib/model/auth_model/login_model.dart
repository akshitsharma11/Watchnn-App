import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.message,
    required this.data,
    required this.status,
    required this.xAccessToken,
  });

  String? message;
  Data? data;
  bool status;
  String? xAccessToken;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json.keys.contains("message") == true ? json["message"] : null,
        data: json.keys.contains("data") == true
            ? Data.fromJson(json["data"])
            : null,
        status: json["status"],
        xAccessToken: json.keys.contains("x-access-token") == true
            ? json["x-access-token"]
            : null,
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
        "status": status,
        "x-access-token": xAccessToken,
      };
}

class Data {
  Data({
    required this.userEmail,
    required this.name,
    required this.dob,
    required this.age,
    required this.gender,
    required this.password,
    required this.imageUrl,
    required this.phoneNo,
    required this.country,
    required this.countryCode,
    required this.address,
    required this.pinCode,
    required this.bio,
    required this.city,
    required this.uid,
    required this.playerId,
    required this.deviceOs,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String userEmail;
  String name;
  dynamic dob;
  int age;
  String gender;
  String password;
  String imageUrl;
  int phoneNo;
  String country;
  String countryCode;
  String address;
  String pinCode;
  String bio;
  String city;
  String uid;
  String playerId;
  String deviceOs;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userEmail: json["user_email"],
        name: json["name"],
        dob: json["dob"],
        age: json["age"],
        gender: json["gender"],
        password: json["password"],
        imageUrl: json["imageUrl"],
        phoneNo: json["phone_no"],
        country: json["country"],
        countryCode: json["countryCode"],
        address: json["address"],
        pinCode: json["pinCode"],
        bio: json["bio"],
        city: json["city"],
        uid: json["uid"],
        playerId: json["playerID"],
        deviceOs: json["deviceOS"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "user_email": userEmail,
        "name": name,
        "dob": dob,
        "age": age,
        "gender": gender,
        "password": password,
        "imageUrl": imageUrl,
        "phone_no": phoneNo,
        "country": country,
        "countryCode": countryCode,
        "address": address,
        "pinCode": pinCode,
        "bio": bio,
        "city": city,
        "uid": uid,
        "playerID": playerId,
        "deviceOS": deviceOs,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
