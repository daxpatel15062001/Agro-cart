import 'dart:collection';
import 'package:agrocart/backend/models/createUser_model.dart';
import 'package:agrocart/backend/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthNotifier with ChangeNotifier {
  List<UserModel> _userList = [];
  String uid;
  User _user;
  UserModel users;
  List<CreateUserModel> _createUserList = [];
  CreateUserModel _currentUser;
  User get user => _user;
  UserModel get userinfo => users;
  // UnmodifiableListView<UserModel> get userList =>
  //     UnmodifiableListView(_userList);

  void setUser(User user) {
    _user = user;
    user == null ? uid = null : uid = user.uid;
    //user == null ? email = null : uid = user.email;
    //user == null ? password = null : uid = user.uid;

    notifyListeners();
  }

  String get userId => uid;

  //For all the users

  UnmodifiableListView<CreateUserModel> get userListt =>
      UnmodifiableListView(_createUserList);

  set userListt(List<CreateUserModel> userList) {
    _createUserList = userList;
    notifyListeners();
  }

  CreateUserModel get currentUser => _currentUser;

  addUser(CreateUserModel userr) {
    _createUserList.insert(0, userr);
    notifyListeners();
  }

  set currentUser(CreateUserModel userrr) {
    _currentUser = userrr;
    notifyListeners();
  }
  //String get userEmail => email;

  //String get userPassword => password;

}
