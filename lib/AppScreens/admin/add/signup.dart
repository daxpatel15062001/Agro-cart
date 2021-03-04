import 'package:agrocart/backend/models/createUser_model.dart';
import 'package:agrocart/backend/notifier/auth_notofier.dart';
import 'package:agrocart/universal/add_scaffold.dart';
import 'package:agrocart/utils/agrocart.dart';
import 'package:flutter/material.dart';
import 'package:agrocart/backend/api/user_api.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
String capcaha;

class SignUp extends StatefulWidget {
  final bool isUpdating;
  Function callback;
  SignUp({@required this.isUpdating, this.callback});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = new GlobalKey<FormState>();
  CreateUserModel userDetail = CreateUserModel();
  String phoneNo, verificationId, smsCode;

  //final TextEditingController _passwordController = new TextEditingController();
  CreateUserModel _currentUser;

  void initState() {
    super.initState();
    if (!widget.isUpdating) {
      //t1.dispose();
    }
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    if (authNotifier.currentUser != null) {
      _currentUser = authNotifier.currentUser;
    } else {
      _currentUser = CreateUserModel();
    }
  }

  Widget _buildDisplayNameField() {
    return Column(
      children: <Widget>[
        TextFormField(
          initialValue: _currentUser.displayName,
          decoration: InputDecoration(
            labelText: "Display Name",
            labelStyle: TextStyle(color: Colors.grey),
            enabledBorder: new UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
// and:
            focusedBorder: new UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 17, color: Colors.black),
          cursorColor: AgrocartUniversal.contrastColor,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Display Name is required';
            }

            if (value.length < 5 || value.length > 12) {
              return 'Display Name must be betweem 5 and 12 characters';
            }

            return null;
          },
          onSaved: (String value) {
            userDetail.displayName = value;
          },
        ),
        // TextFormField(
        //   decoration: InputDecoration(
        //     labelText: "Phone No",
        //     labelStyle: TextStyle(color: Colors.black),
        //   ),
        //   keyboardType: TextInputType.number,
        //   style: TextStyle(fontSize: 19, color: Colors.black),
        //   cursorColor: Colors.white,
        //   validator: (String value) {
        //     if (value.isEmpty) {
        //       return 'Phoneno is required';
        //     }

        //     if (value.length < 10 || value.length > 10) {
        //       return 'Phone no length should be 10';
        //     }

        //     return null;
        //   },
        //   onSaved: (String value) {
        //     userDetail.number = value;
        //   },
        // ),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      initialValue: _currentUser.email,
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.grey),
        enabledBorder: new UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
// and:
        focusedBorder: new UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      // keyboardType: TextInputType.emailAddress,
      style: TextStyle(fontSize: 17, color: Colors.black),
      cursorColor: AgrocartUniversal.contrastColor,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }

        // if (!RegExp(
        //         r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        //     //r"\w+@charusat+\.edu+\.in$")
        //     .hasMatch(value)) {
        //   return 'Please enter a valid email address';
        // }

        return null;
      },
      onSaved: (String value) {
        userDetail.email = value;
        userDetail.uid = value;
        userDetail.address = 'Random Address';
        userDetail.isverified = false;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      initialValue: _currentUser.password,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: Colors.grey),
        enabledBorder: new UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
// and:
        focusedBorder: new UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      style: TextStyle(fontSize: 17, color: Colors.black),
      cursorColor: AgrocartUniversal.contrastColor,
      obscureText: widget.isUpdating ? false : true,
      //  controller: _passwordController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is required';
        }

        if (value.length < 5 || value.length > 20) {
          return 'Password must be betweem 5 and 20 characters';
        }

        return null;
      },
      onSaved: (String value) {
        userDetail.password = value;
      },
    );
  }

  _onUserUploaded(CreateUserModel user) {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    authNotifier.addUser(user);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    return AddScaffold(
      title: widget.isUpdating ? 'Edit User' : 'Add Customers',
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: TextFormField(
                      initialValue: _currentUser.phoneNumber,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Enter Phone number",
                        // hintText: '+91 ',
                        //prefixText: '+91',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
// and:
                        focusedBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      cursorColor: AgrocartUniversal.contrastColor,
                      onChanged: (val) {
                        setState(() {
                          this.phoneNo = val;
                          userDetail.phoneNumber = val;
                          // userDetail.email =
                          //     val.substring(4) + '@gmail.com';
                        });
                      },
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: _buildDisplayNameField(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: _buildEmailField(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: _buildPasswordField(),
                ),

                SizedBox(
                  height: 30,
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    // hoverColor: Colors.white,
                    //highlightColor: AgrocartUniversal.contrastColorLight,
                    borderRadius: BorderRadius.circular(25),
                    onTap: widget.isUpdating
                        ? () {
                            updateUserData(_currentUser, _onUserUploaded);
                            //Navigator.of(context).pop();
                          }
                        : () {
                            if (!formKey.currentState.validate()) {
                              return;
                            }
                            formKey.currentState.save();
                            addUserDataNew(userDetail).then(
                              (value) {
                                Fluttertoast.showToast(
                                    msg: "User Added",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor:
                                        AgrocartUniversal.contrastColor,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                Navigator.of(context).pop();
                              },
                            ).catchError((error) {
                              Fluttertoast.showToast(
                                  msg: "Failed",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor:
                                      AgrocartUniversal.contrastColorLight,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              print("Failed to add user: $error");
                            });
                          },
                    child: Ink(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.88,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: AgrocartUniversal.customBoxShadow,
                          color: AgrocartUniversal.contrastColor,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            !widget.isUpdating ? 'Create User' : 'Update User',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
