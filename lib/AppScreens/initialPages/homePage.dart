import 'package:agrocart/AppScreens/admin/Addthings.dart';
import 'package:agrocart/AppScreens/admin/Products.dart';
import 'package:agrocart/AppScreens/admin/Users.dart';
import 'package:agrocart/AppScreens/admin/dashboard.dart';
import 'package:agrocart/AppScreens/customer/categories.dart';
import 'package:agrocart/AppScreens/customer/homescreen.dart';
import 'package:agrocart/AppScreens/customer/profile.dart';
import 'package:agrocart/backend/api/user_api.dart';
import 'package:agrocart/backend/models/user_model.dart';
import 'package:agrocart/utils/agrocart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomerHome extends StatefulWidget {
  String currentuser;
  CustomerHome({Key key, this.currentuser}) : super(key: key);

  @override
  _CustomerHomeState createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  // _CustomerHomeState({Key key, this.uid});
  // CustomerHome obj = CustomerHome();
  // static String uid = widget.currentuser;

  UserModel user = UserModel();

  int _selectedPage = 0;

  // String uid = widget.currentuser;

  final PageStorageBucket bucket = PageStorageBucket();

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pageOptions =
        widget.currentuser == '7lb1IxegmHUzN1g8oUWOR5iR7rF3'
            ? [
                Dashboard(),
                AddThings(),
                Products(),
                Users(),
              ]
            : [
                HomeScreen(),
                Categories(),
                Profile(signout),
              ];
    // print(currentuser);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Material(
        child: Scaffold(
            body: PageStorage(
              child: _pageOptions[_selectedPage],
              bucket: bucket,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 30,
              selectedItemColor: AgrocartUniversal.contrastColor,
              unselectedItemColor: Colors.black,
              currentIndex: _selectedPage,
              onTap: (int index) {
                setState(() {
                  _selectedPage = index;
                });
              },
              items: widget.currentuser == '7lb1IxegmHUzN1g8oUWOR5iR7rF3'
                  ? [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        title: Text('Dashboard'),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.add_circle),
                        title: Text('Add'),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.category),
                        title: Text('Products'),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.people),
                        title: Text('Users'),
                      ),
                    ]
                  : [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        title: Text('Home'),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.category),
                        title: Text('Categories'),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        title: Text('Profile'),
                      ),
                    ],
            )),
      ),
    );
    // AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    // return Scaffold(
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

  @override
  void dispose() {
    super.dispose();
  }
}
