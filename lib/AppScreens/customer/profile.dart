import 'package:agrocart/backend/notifier/auth_notofier.dart';
import 'package:agrocart/constants.dart';
import 'package:agrocart/widgets/Logout_item.dart';
import 'package:agrocart/widgets/profile_list_item.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';



// class ProfileScreen extends StatelessWidget {
//     //const ProfileScreen(this._signOut);

//    final Function(AuthNotifier authNotifier) _signOut;



//   Widget _buildCoverImage(Size screenSize,BuildContext context) {
//     return Container(
//       height: screenSize.height / 6.0,
//       color: Theme.of(context).backgroundColor,


//     );
//   }
//     final buttonLogin = LogoutItem(
//     icon: LineAwesomeIcons.alternate_sign_out,
//     text: 'Logout',
//     hasNavigation: false,
//   );
//   Widget _ProfileImage(BuildContext context ) {
//     BuildContext c;
//     return Center(
//       child: Container(
//         width: 140.0,
//         height: 140.0,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage('https://img.freepik.com/free-photo/handsome-young-businessman-shirt-eyeglasses_85574-6228.jpg?size=626&ext=jpg'),
//             fit: BoxFit.cover,
//           ),
//           borderRadius: BorderRadius.circular(80.0),
//             border: Border.all(
// //              color: Theme.of(context).scaffoldBackgroundColor,
//               color: Theme.of(context).scaffoldBackgroundColor,


//               width: 5.0,
//             ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileImage( BuildContext context) {
//     return Center(
//       child: Column(
//         children: <Widget>[
//           Container(

//             height: kSpacingUnit.w * 13,
//             width: kSpacingUnit.w*13,
//             margin: EdgeInsets.only(top: kSpacingUnit.w * 2),
//             child: Stack(
//               children: <Widget>[
//                 _ProfileImage(context),


//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     height: kSpacingUnit.w * 4,
//                     width: kSpacingUnit.w * 4,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).scaffoldBackgroundColor,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Center(
//                       heightFactor: kSpacingUnit.w * 1.5,
//                       widthFactor: kSpacingUnit.w * 1.5,
//                       child: Icon(
//                         LineAwesomeIcons.pen,
//                         color: Theme.of(context).accentColor,

//                         size: ScreenUtil().setSp(kSpacingUnit.w * 2.5),
//                       ),
//                     ),
//                   ),
//                 ),

//               ],
//             ),
//           ),
//         ],

//       ),
//     );
//   }



//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
//     Size screenSize = MediaQuery.of(context).size;
//   String UserName= "Jay Patel";
//   String UserEmail="18ce077@charusat.edu.in";
//   String UserContact="+919724246897";

//     var profileInfo = Expanded(
//       child: Column(
//         children: <Widget>[
//           Container(

//             height: kSpacingUnit.w * 10,
//             width: kSpacingUnit.w*10,
//             margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
//             child: Stack(
//               children: <Widget>[

//                 CircleAvatar(
//                   radius: kSpacingUnit.w * 5,
//                   backgroundImage: AssetImage('assets/images/avatar.png'),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     height: kSpacingUnit.w * 2.5,
//                     width: kSpacingUnit.w * 2.5,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).accentColor,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Center(
//                       heightFactor: kSpacingUnit.w * 1.5,
//                       widthFactor: kSpacingUnit.w * 1.5,
//                       child: Icon(
//                         LineAwesomeIcons.pen,
//                         color: kDarkPrimaryColor,
//                         size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );


//     var themeSwitcher = ThemeSwitcher(
//       builder: (context) {
//         return AnimatedCrossFade(
//           duration: Duration(milliseconds: 100),
//           crossFadeState:
//           ThemeProvider.of(context).brightness == Brightness.dark
//               ? CrossFadeState.showFirst
//               : CrossFadeState.showSecond,
//           firstChild: GestureDetector(
//             onTap: () =>
//                 ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
//             child: Icon(
//               LineAwesomeIcons.sun,
//               size: ScreenUtil().setSp(kSpacingUnit.w * 4),
//             ),
//           ),
//           secondChild: GestureDetector(
//             onTap: () =>
//                 ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
//             child: Icon(
//               LineAwesomeIcons.moon,
//               size: ScreenUtil().setSp(kSpacingUnit.w * 4),
//             ),
//           ),
//         );
//       },
//     );

//     var header = Row(

//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(width: kSpacingUnit.w * 3),
//         profileInfo,
//         themeSwitcher,
//       ],
//     );
//     var theme =Row(

//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         new Padding(
//           padding: EdgeInsets.only(right: 50),
//         ),
//         new Container(
//           margin: const EdgeInsets.only(top: 10.0,right: 10),
//           child: themeSwitcher,
//         ),


//       ],
//     );


//     var header2 = Stack(
//         children: <Widget>[
//           _buildCoverImage(screenSize,context),
//           theme,
//           SafeArea(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   SizedBox(height: screenSize.height / 19.4),
//                   _buildProfileImage(context),
//                   SizedBox(height: 10.0),
//                   SizedBox(height: 8.0),
//                 ],
//               ),
//             ),
//           ),
//         ]

//           );

//     return ThemeSwitchingArea(
//       child: Builder(
//         builder: (context) {

//           return Scaffold(
//             body: Column(


//               children: <Widget>[
//                 SizedBox(height: kSpacingUnit.w * 3),

//                 header2,
//                 Expanded(
//                   child: ListView(
//                     children: <Widget>[


//                       ProfileListItem(
//                         icon: LineAwesomeIcons.user,
//                         text: UserName,
//                         hasNavigation: false,

//                       ),
//                       ProfileListItem(
//                         icon: LineAwesomeIcons.mail_bulk,
//                         text: UserEmail,
//                         hasNavigation: false,

//                       ),
//                       ProfileListItem(
//                         icon: LineAwesomeIcons.phone,
//                         text: UserContact,
//                         hasNavigation: false,

//                       ),

//                       buttonLogin,


//                     ],
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
class Profile extends StatelessWidget {
  final Function(AuthNotifier authNotifier) _signOut;

  const Profile(this._signOut);
  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('CustomerHomes',
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body: Container(
          child: Column(
        children: [
          // Center(child: Text(user.id)),
          RaisedButton(
            child: Text('LogOut'),
            onPressed: () => _signOut(authNotifier),
          ),
          // RaisedButton(
          //   child: Text('Google Logout'),
          //   onPressed: () => handleSignOut(),
          // ),
        ],
      )),
    );
  }
}
