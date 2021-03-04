// import 'package:agrocart/AppScreens/initialPages/login.dart';
// import 'package:agrocart/backend/notifier/auth_notofier.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:agrocart/backend/api/user_api.dart';
// import 'package:provider/provider.dart';

// class SignUPNew extends StatefulWidget {
//   SignUPNew(this.numberr);
//   String numberr;

//   @override
//   _SignUPNewState createState() => _SignUPNewState();
// }

// class _SignUPNewState extends State<SignUPNew> {
//   final formKey = new GlobalKey<FormState>();

//   // void _submitForm() {
//   //   if (!formKey.currentState.validate()) {
//   //     return;
//   //   }
//   //   formKey.currentState.save();

//   //   AuthNotifier authNotifier =
//   //       Provider.of<AuthNotifier>(context, listen: false);
//   //   signup(userr, authNotifier);
//   // }

//   String phoneNo, verificationId, smsCode;

//   bool codeSent = false;
//   final TextEditingController _passwordController = new TextEditingController();

//   Widget _buildDisplayNameField() {
//     return Column(
//       children: <Widget>[
//         TextFormField(
//           decoration: InputDecoration(
//             labelText: "Display Name",
//             labelStyle: TextStyle(color: Colors.black),
//           ),
//           keyboardType: TextInputType.text,
//           style: TextStyle(fontSize: 19, color: Colors.black),
//           cursorColor: Colors.white,
//           validator: (String value) {
//             if (value.isEmpty) {
//               return 'Display Name is required';
//             }

//             if (value.length < 5 || value.length > 12) {
//               return 'Display Name must be betweem 5 and 12 characters';
//             }

//             return null;
//           },
//           onSaved: (String value) {
//             userr.name = value;
//           },
//         ),
//         // TextFormField(
//         //   decoration: InputDecoration(
//         //     labelText: "Phone No",
//         //     labelStyle: TextStyle(color: Colors.black),
//         //   ),
//         //   keyboardType: TextInputType.number,
//         //   style: TextStyle(fontSize: 19, color: Colors.black),
//         //   cursorColor: Colors.white,
//         //   validator: (String value) {
//         //     if (value.isEmpty) {
//         //       return 'Phoneno is required';
//         //     }

//         //     if (value.length < 10 || value.length > 10) {
//         //       return 'Phone no length should be 10';
//         //     }

//         //     return null;
//         //   },
//         //   onSaved: (String value) {
//         //     userr.number = value;
//         //   },
//         // ),
//       ],
//     );
//   }

//   // Widget _buildEmailField() {
//   //   return TextFormField(
//   //     decoration: InputDecoration(
//   //       labelText: "Email",
//   //       labelStyle: TextStyle(color: Colors.black),
//   //     ),
//   //     keyboardType: TextInputType.emailAddress,
//   //     style: TextStyle(fontSize: 19, color: Colors.black),
//   //     cursorColor: Colors.white,
//   //     validator: (String value) {
//   //       if (value.isEmpty) {
//   //         return 'Email is required';
//   //       }

//   //       if (!RegExp(
//   //               r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
//   //           //r"\w+@charusat+\.edu+\.in$")
//   //           .hasMatch(value)) {
//   //         return 'Please enter a valid email address';
//   //       }

//   //       return null;
//   //     },
//   //     onSaved: (String value) {
//   //       userr.email = value;
//   //     },
//   //   );
//   // }

//   Widget _buildPasswordField() {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: "Password",
//         labelStyle: TextStyle(color: Colors.black),
//       ),
//       style: TextStyle(fontSize: 19, color: Colors.black),
//       cursorColor: Colors.white,
//       obscureText: true,
//       controller: _passwordController,
//       validator: (String value) {
//         if (value.isEmpty) {
//           return 'Password is required';
//         }

//         if (value.length < 5 || value.length > 20) {
//           return 'Password must be betweem 5 and 20 characters';
//         }

//         return null;
//       },
//       onSaved: (String value) {
//         userr.password = value;
//         userr.email = '94281686888@gmail.com';
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // Padding(
//               //     padding: EdgeInsets.only(left: 25.0, right: 25.0),
//               //     child: TextFormField(
//               //       keyboardType: TextInputType.phone,
//               //       decoration: InputDecoration(hintText: 'Enter phone number'),
//               //       onChanged: (val) {
//               //         setState(() {
//               //           this.phoneNo = val;
//               //         });
//               //       },
//               //     )),
//               // codeSent
//               //     ? Padding(
//               //         padding: EdgeInsets.only(left: 25.0, right: 25.0),
//               //         child: TextFormField(
//               //           keyboardType: TextInputType.phone,
//               //           decoration: InputDecoration(hintText: 'Enter OTP'),
//               //           onChanged: (val) {
//               //             setState(() {
//               //               this.smsCode = val;
//               //             });
//               //           },
//               //         ))
//               //     : Container(),
//               _buildDisplayNameField(),
//               //_buildEmailField(),
//               _buildPasswordField(),
//               Padding(
//                   padding: EdgeInsets.only(left: 25.0, right: 25.0),
//                   child: RaisedButton(
//                       child: Center(
//                           child: Text('Add User')),
//                       onPressed: () {
//                         // codeSent
//                         //     ? signInWithOTP(smsCode, verificationId)
//                         //     : verifyPhone(phoneNo);
//                    //     _submitForm();
//                       }))
//             ],
//           )),
//     );
//   }

// //   Future<void> verifyPhone(phoneNo) async {
// //     final PhoneVerificationCompleted verified = (AuthCredential authResult) {
// //       signIn(authResult);
// //     };

// //     final PhoneVerificationFailed verificationfailed =
// //         (FirebaseAuthException e) {
// //       if (e.code == 'invalid-phone-number') {
// //         print('The provided phone number is not valid.');
// //       }

// //       // Handle other errors
// //     };

// //     final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
// //       this.verificationId = verId;
// //       setState(() {
// //         this.codeSent = true;
// //       });
// //     };

// //     final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
// //       this.verificationId = verId;
// //     };

// //     await FirebaseAuth.instance.verifyPhoneNumber(
// //         phoneNumber: phoneNo,
// //         timeout: const Duration(seconds: 5),
// //         verificationCompleted: verified,
// //         verificationFailed: verificationfailed,
// //         codeSent: smsSent,
// //         codeAutoRetrievalTimeout: autoTimeout);
// //   }
// }
