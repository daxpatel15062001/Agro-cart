import 'package:agrocart/AppScreens/admin/users/userList.dart';
import 'package:agrocart/backend/api/user_api.dart';
import 'package:agrocart/backend/notifier/auth_notofier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);

    return UserList();
    // Scaffold(
    //   appBar: AppBar(
    //     title: Text('CustomerHomes',
    //         style: TextStyle(
    //           color: Colors.black,
    //         )),
    //   ),
    //   body: Container(
    //       child: Column(
    //     children: [
    //       // Center(child: Text(user.id)),

    //       RaisedButton(
    //         child: Text('LogOut'),
    //         onPressed: () => signout(authNotifier),
    //       ),
    //       // RaisedButton(
    //       //   child: Text('Google Logout'),
    //       //   onPressed: () => handleSignOut(),
    //       // ),
    //     ],
    //   )),
    // );
  }
}
