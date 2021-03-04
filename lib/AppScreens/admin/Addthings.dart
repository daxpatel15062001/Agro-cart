import 'package:agrocart/AppScreens/admin/add/addProduct.dart';
import 'package:agrocart/AppScreens/admin/add/signup.dart';
import 'package:agrocart/universal/add_scaffold.dart';
import 'package:agrocart/utils/agrocart.dart';
import 'package:flutter/material.dart';

class AddThings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AddScaffold(
        title: 'Add Things',
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.only(top: 30),
            alignment: Alignment.topCenter,
            child: Wrap(
              spacing: 20,
              runSpacing: 20.0,
              children: [
                ActionCard(
                    icon: Icons.people,
                    title: 'Add Customers',
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => SignUp(
                                    isUpdating: false,
                                  )));
                    }),
                ActionCard(
                    icon: Icons.add_circle,
                    title: 'Add Product',
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => Upload(
                                    isUpdating: false,
                                  )));
                    }),
                ActionCard(
                    icon: Icons.card_giftcard,
                    title: 'Add Rewards',
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     new MaterialPageRoute(
                      //         builder: (context) => Timeline()));
                    }),
                ActionCard(
                    icon: Icons.local_offer,
                    title: 'Add Offers',
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     new MaterialPageRoute(
                      //         builder: (context) => Timeline()));
                    }),
              ],
            ),
          ),
        ));
  }
}

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;

  const ActionCard({Key key, this.onPressed, this.icon, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(0xffffb3b3),
      borderRadius: BorderRadius.circular(8),
      hoverColor: AgrocartUniversal.contrastColor,
      onTap: onPressed,
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            color: AgrocartUniversal.contrastColorLight,
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(color: Color(0xfff8bc05))
            boxShadow: AgrocartUniversal.customBoxShadow),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: 50,
              child: Icon(
                icon,
                size: 50,
                color: AgrocartUniversal.contrastColor,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
