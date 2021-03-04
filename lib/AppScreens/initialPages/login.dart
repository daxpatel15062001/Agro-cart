import 'package:agrocart/backend/api/user_api.dart';
import 'package:agrocart/backend/models/user_model.dart';
import 'package:agrocart/backend/notifier/auth_notofier.dart';
import 'package:agrocart/utils/agrocart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

UserModel userr = UserModel();

enum AuthMode { Signup, Login }

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = new TextEditingController();
  AuthMode _authMode = AuthMode.Login;
  // String _errorMessage;
  String _dropDownValue;

  bool progress = false;

  @override
  void initState() {
    setState(() {
      progress = true;
    });
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier);

    super.initState();
   
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    if (_authMode == AuthMode.Login) {
      login(userr, authNotifier);
      
    } else {
      // _showVerifyEmailSentDialog();
     // signup(userr, authNotifier);
      // sendEmailVerification();

    }
  }

  // Widget _buildCollegeField() {
  //   return Container(
  //     padding: EdgeInsets.all(10),
  //     child: DropdownButton(
  //       iconEnabledColor: Colors.grey,
  //       hint: _dropDownValue == null
  //           ? Text('COLLEGE')
  //           : Text(
  //               _dropDownValue,
  //               style: TextStyle(
  //                 color: Colors.black,
  //                 fontFamily: 'Montserrat',
  //               ),
  //             ),
  //       isExpanded: true,
  //       iconSize: 30.0,
  //       style: TextStyle(
  //         color: Colors.black,
  //         fontFamily: 'Montserrat',
  //       ),
  //       items: ['adit', 'cspit', 'gcet'].map(
  //         (val) {
  //           return DropdownMenuItem<String>(
  //             value: val,
  //             child: Text(val),
  //           );
  //         },
  //       ).toList(),
  //       onChanged: (val) {
  //         setState(
  //           () {
  //             _dropDownValue = val;
  //             _user.college = val;
  //           },
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _buildDisplayNameField() {
    return Column(
      children: <Widget>[
        // Container(
        //   padding: EdgeInsets.all(10),
        //   child: DropdownButton(
        //     iconEnabledColor: Colors.grey,
        //     hint: _dropDownValue == null
        //         ? Text('COLLEGE')
        //         : Text(
        //             _dropDownValue,
        //             style: TextStyle(
        //               color: Colors.black,
        //               fontFamily: 'Montserrat',
        //             ),
        //           ),
        //     isExpanded: true,
        //     iconSize: 30.0,
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontFamily: 'Montserrat',
        //     ),
        //     items: ['adit', 'cspit', 'gcet'].map(
        //       (val) {
        //         return DropdownMenuItem<String>(
        //           value: val,
        //           child: Text(val),
        //         );
        //       },
        //     ).toList(),
        //     onChanged: (val) {
        //       setState(
        //         () {
        //           _dropDownValue = val;
        //           userr.college = val;
        //         },
        //       );
        //     },
        //   ),
        // ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Display Name",
            labelStyle: TextStyle(color: Colors.grey),
          ),
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 19, color: Colors.black),
          cursorColor: Colors.black,
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
            userr.displayName = value;
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Phone No",
            labelStyle: TextStyle(color: Colors.grey),
          ),
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 19, color: Colors.black),
          cursorColor: Colors.black,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Phoneno is required';
            }

            if (value.length < 10 || value.length > 10) {
              return 'Phone no length should be 10';
            }

            return null;
          },
          onSaved: (String value) {
            userr.phoneNumber = value;
          },
        ),
      ],
    );
  }

  // Widget _buildPhoneNumberField() {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: "Phone No",

  //       labelStyle: TextStyle(color: Colors.white54),
  //     ),
  //     keyboardType: TextInputType.number,
  //     style: TextStyle(fontSize: 19, color: Colors.white),
  //     cursorColor: Colors.white,
  //     validator: (String value) {
  //       if (value.isEmpty) {
  //         return 'Phoneno is required';
  //       }

  //       if (value.length < 10 || value.length > 10) {
  //         return 'Phone no length should be 10';
  //       }

  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _user.number = value;
  //     },
  //   );
  // }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.grey),
      ),
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(fontSize: 19, color: Colors.black),
      cursorColor: Colors.black,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            //r"\w+@charusat+\.edu+\.in$")
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }

        return null;
      },
      onSaved: (String value) {
        userr.email = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: Colors.grey),
      ),
      style: TextStyle(fontSize: 19, color: Colors.black),
      cursorColor: Colors.black,
      obscureText: true,
      controller: _passwordController,
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
        userr.password = value;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Confirm Password",
        labelStyle: TextStyle(color: Colors.grey),
      ),
      style: TextStyle(fontSize: 19, color: Colors.black),
      cursorColor: Colors.black,
      obscureText: true,
      validator: (String value) {
        if (_passwordController.text != value) {
          return 'Passwords do not match';
        }

        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Building login screen");
     setState(() {
      progress = false;
    });

    return Scaffold(
      body: progress == false
          ? Container(
              constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height,
              ),
              decoration: BoxDecoration(color: Colors.white,
             // Color(0xff34056D)
              ),
              child: Form(
                autovalidate: true,
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(32, 76, 32, 0),
                    child: Column(
                      children: <Widget>[
                        _authMode == AuthMode.Signup
                            ? Container(
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 20.0, 100.0, 0.0),
                                      child: Text('Signup',
                                          style: TextStyle(
                                              fontSize: 60.0,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          230.0, 20.0, 70.0, 0.0),
                                      child: Text('.',
                                          style: TextStyle(
                                              fontSize: 65.0,
                                              fontWeight: FontWeight.bold,
                                              color: AgrocartUniversal.contrastColor)),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 20.0, 110.0, 0.0),
                                      child: Text('Login',
                                          style: TextStyle(
                                              fontSize: 65.0,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          200.0, 20.0, 100.0, 0.0),
                                      child: Text('.',
                                          style: TextStyle(
                                              fontSize: 65.0,
                                              fontWeight: FontWeight.bold,
                                              color: AgrocartUniversal.contrastColor)),
                                    ),
                                  ],
                                ),
                              ),
                        SizedBox(height: 29),
                        _authMode == AuthMode.Signup
                            ? _buildDisplayNameField()
                            : Container(),
                        _buildEmailField(),
                        _buildPasswordField(),
                        _authMode == AuthMode.Signup
                            ? _buildConfirmPasswordField()
                            : Container(),
                        SizedBox(height: 30),
                        ButtonTheme(
                          minWidth: 380,
                          child: RaisedButton(
                            color: AgrocartUniversal.contrastColor,
                            padding: EdgeInsets.all(10.0),
                            onPressed: () => _submitForm(),
                            child: Text(
                              _authMode == AuthMode.Login ? 'Login' : 'Signup',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        ButtonTheme(
                          minWidth: 200,
                          child: FlatButton(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Not Have Account? Switch to ${_authMode == AuthMode.Login ? 'Signup' : 'Login'}',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                            onPressed: () {
                              setState(() {
                                _authMode = _authMode == AuthMode.Login
                                    ? AuthMode.Signup
                                    : AuthMode.Login;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  // void _showVerifyEmailSentDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       // return object of type Dialog
  //       return AlertDialog(
  //         title: new Text("Verify your account"),
  //         content:
  //             new Text("Link to verify account has been sent to your email"),
  //         actions: <Widget>[
  //           new FlatButton(
  //             child: new Text("Dismiss"),
  //             onPressed: () {
  //               _changeFormToLogin();
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

//   void _changeFormToLogin() {
//     _formKey.currentState.reset();
//     _errorMessage = "";
//     setState(() {
//       _authMode = AuthMode.Login;
//     });
//   }
}
