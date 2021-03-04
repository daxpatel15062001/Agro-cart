import 'dart:core' as prefix0;
import 'dart:core';
import 'package:agrocart/backend/models/createUser_model.dart';
import 'package:agrocart/backend/models/dashboardModel.dart';
import 'package:agrocart/backend/models/user_model.dart';
import 'package:agrocart/backend/notifier/auth_notofier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

DashBoardModel dashBoard = DashBoardModel();
login(UserModel user, AuthNotifier authNotifier) async {
  //prefs = await SharedPreferences.getInstance();
  UserCredential authResult = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((error) => print(error.code));

  if (authResult != null) {
    User firebaseUser = authResult.user;

    if (firebaseUser != null) {
      print("Log In: $firebaseUser");
      authNotifier.setUser(firebaseUser);
    }
  }
}

// signup(UserModel user, AuthNotifier authNotifier) async {
//   UserCredential authResult = await FirebaseAuth.instance
//       .createUserWithEmailAndPassword(
//           email: user.email, password: user.password)
//       .catchError((error) => print(error.code));
//   User firebaseUser = await FirebaseAuth.instance.currentUser;

//   var map = <String, int>{};

//   FirebaseFirestore.instance.collection('cart').doc(firebaseUser.uid).set(map);

//   if (authResult != null) {
//     //UserUpdateInfo updateInfo = UserUpdateInfo();
//     //updateInfo.displayName = user.name;
//     //updateInfo.college = user.college;

//     User firebaseUser = authResult.user;

//     if (firebaseUser != null) {
//       // await firebaseUser.updateProfile(updateInfo);

//       await firebaseUser.reload();

//       print("Sign up: $firebaseUser");
//       User currentUser = await FirebaseAuth.instance.currentUser;
//       addUserData(user);
//       authNotifier.setUser(currentUser);
//     }
//   }
// }

//Signout api
void signout(AuthNotifier authNotifier) async {
  await Firebase.initializeApp();
  await FirebaseAuth.instance
      .signOut()
      .catchError((error) => print(error.code));
  authNotifier.setUser(null);
}

//check user is logged in or not
initializeCurrentUser(AuthNotifier authNotifier) async {
  await Firebase.initializeApp();
  User firebaseUser = FirebaseAuth.instance.currentUser;
  if (firebaseUser != null) {
    authNotifier.setUser(firebaseUser);
  }
}

Future addUserData(UserModel user) async {
  //prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  final ref = FirebaseFirestore.instance.collection("users");
  User firebaseUser = await FirebaseAuth.instance.currentUser;
  print("Uid:$firebaseUser.uid");
  //await prefs.setString('id', firebaseUser.uid);
  user.uid = firebaseUser.uid;
  return await ref.doc(firebaseUser.uid).set(user.toMap());
}

Future addUserDataAndUpdate(CreateUserModel user, bool isUpdating) async {
  //prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  final ref = FirebaseFirestore.instance.collection("users");
  User firebaseUser = await FirebaseAuth.instance.currentUser;
  print("Uid:$firebaseUser.uid");
  //await prefs.setString('id', firebaseUser.uid);
  user.uid = firebaseUser.uid;
  return await ref.doc(firebaseUser.uid).set(user.toMap());
}

updateUserData(
  CreateUserModel user,
  Function foodUploaded,
) async {
  CollectionReference foodRef = FirebaseFirestore.instance.collection('users');
  user.updatedAt = Timestamp.now();
  //food.userId = currentUser.uid;
  String fChar = user.displayName[0];
  user.firstChar = fChar;
  print(fChar);
  await foodRef.doc(user.uid).update(user.toMap());

  foodUploaded(user);
  print('Updated User with id: ${user.uid}');
}

getUsers(AuthNotifier authnotifier) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('users').get();

  List<CreateUserModel> _userList = [];

  snapshot.docs.forEach((document) {  
    CreateUserModel book = CreateUserModel.fromMap(document.data());
    _userList.add(book);
  });

  authnotifier.userListt = _userList;
  dashBoard.totalUsers = snapshot.docs.length;
  return snapshot;
}

signup(
  CreateUserModel user,
  AuthNotifier authNotifier,
) async {
  await Firebase.initializeApp();
  addUserDataNew(user);
}

Future addUserDataNew(CreateUserModel user) async {
  //prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp();

  final ref = FirebaseFirestore.instance.collection("newUsers");
  //User firebaseUser = await FirebaseAuth.instance.currentUser;
  print("Uid:${user.uid}");
  //await prefs.setString('id', firebaseUser.uid);
  //user.uid = firebaseUser.uid;
  ref.doc(user.uid).set(user.toMap()).then((value) => value = true);
}