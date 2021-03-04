import 'package:cloud_firestore/cloud_firestore.dart';

class CreateUserModel {
  String displayName;
  String email;
  String password;
  String phoneNumber;
  String uid;
  String address;
  bool isverified;
  Timestamp updatedAt;
  String firstChar;
  Timestamp createdAt;

  CreateUserModel();

  CreateUserModel.fromMap(Map<String, dynamic> data) {
    displayName = data['displayName'];
    email = data['email'];
    password = data['password'];
    phoneNumber = data['phoneNumber'];
    uid = data['uid'];
    address = data['address'];
    isverified = data['isverified'];
    updatedAt = data['updatedAt'];
    firstChar = data['firstChar'];
    createdAt = data['createdAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'uid': uid,
      'address': address,
      'isverified': isverified,
      'updatedAt': updatedAt,
      'firstChar': firstChar,
      'createdAt' : createdAt,
    };
  }
}
