import 'package:agrocart/AppScreens/initialPages/homePage.dart';
import 'package:agrocart/AppScreens/initialPages/login.dart';
import 'package:agrocart/backend/notifier/auth_notofier.dart';
import 'package:agrocart/backend/notifier/product_notifier.dart';
import 'package:agrocart/utils/agrocart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthNotifier(),
      ),
      ChangeNotifierProvider(
        create: (BuildContext context) {
          return BookNotifier();
        },
      )
    ],
    child: AgroCart(),
  ));
}

class AgroCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: AgrocartUniversal.google_sans_family,
          primarySwatch: Colors.lightGreen,
          primaryColor: Colors.white,
          disabledColor: Colors.grey,
          cardColor: Colors.white,
          canvasColor: Colors.grey[50],
          brightness: Brightness.light,
          buttonTheme: Theme.of(context)
              .buttonTheme
              .copyWith(colorScheme: ColorScheme.light()),
          appBarTheme: AppBarTheme(
            elevation: 0.0,
          ),),
      home: Consumer<AuthNotifier>(
        builder: (context, notifier, child) {
          return notifier.user != null
              ? CustomerHome(currentuser: notifier.userId)
              : Login();
        },
      ),
    );
  }
}
