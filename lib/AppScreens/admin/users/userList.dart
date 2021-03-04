import 'package:agrocart/AppScreens/admin/users/displayUser.dart';
import 'package:agrocart/backend/api/user_api.dart';
import 'package:agrocart/backend/notifier/auth_notofier.dart';
import 'package:agrocart/universal/add_scaffold.dart';
import 'package:agrocart/utils/agrocart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  Icon searchIcon = new Icon(Icons.search);
  // void initState() {
  //   AuthNotifier authNotifier =
  //       Provider.of<AuthNotifier>(context, listen: false);
  //   getUsers(authNotifier);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    return AddScaffold(
      title: 'Users',
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
            child: FutureBuilder(
                future: getUsers(authNotifier),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData != true) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return authNotifier.userListt.length == 0
                        ? Center(child: Text('No Data'))
                        : ListView.builder(
                            itemCount: authNotifier.userListt.length,
                            itemBuilder: (BuildContext context, int index) {
                              print(authNotifier.userListt.length);
                              print(authNotifier.userListt[index].displayName);
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () {
                                    authNotifier.currentUser =
                                        authNotifier.userListt[index];
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return UserEdit();
                                    }));
                                  },
                                  child: Ink(
                                    height: 80,
                                    width:
                                        (MediaQuery.of(context).size.width / 2),
                                    decoration: BoxDecoration(
                                      boxShadow:
                                          AgrocartUniversal.customBoxShadow,
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(top: 15),
                                            child: Text(
                                              authNotifier
                                                  .userListt[index].displayName,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.0,
                                              ),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   height: 3,
                                          // ),
                                          Container(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Text(
                                              authNotifier
                                                  .userListt[index].phoneNumber,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: AgrocartUniversal
                                                    .contrastColor,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            physics: ClampingScrollPhysics(),
                          );
                  }
                })),
      ),
    );
  }
}
