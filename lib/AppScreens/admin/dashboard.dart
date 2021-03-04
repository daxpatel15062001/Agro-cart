import 'package:agrocart/AppScreens/admin/products/productsList.dart';
import 'package:agrocart/backend/api/product_api.dart';
import 'package:agrocart/backend/api/user_api.dart';
import 'package:agrocart/backend/notifier/auth_notofier.dart';
import 'package:agrocart/backend/notifier/product_notifier.dart';
import 'package:agrocart/universal/add_scaffold.dart';
import 'package:agrocart/utils/agrocart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  @override
  void initState() {
    AuthNotifier authnotifierr =
        Provider.of<AuthNotifier>(context, listen: false);
    BookNotifier foodNotifier =
        Provider.of<BookNotifier>(context, listen: false);

    getUsers(authnotifierr);
    getProductCount(foodNotifier, 'pesticides');
    getProductCountFertilizer(
      foodNotifier,
      'fertilizers',
    );
    getProductCountSeeds(
      foodNotifier,
      'seeds',
    );
    getProductCountHardware(foodNotifier, 'hardware');
    super.initState();
  }

  Widget build(BuildContext context) {
    return AddScaffold(
        title: 'DashBoard',
        body: dataGot == false
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    //FutureBuilder(
                    //     future: getUsers(authnotifierr),
                    //     builder: (BuildContext context, snapshot) {
                    //       if (snapshot.hasData != true) {
                    //         return Center(
                    //           child: CircularProgressIndicator(),
                    //         );
                    //       } else {
                    // return
                    Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(19),
                      child: ActionCardLong(
                        icon: Icons.people,
                        user: dashBoard.totalUsers,
                        title: 'Total Number of Users',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      alignment: Alignment.topCenter,
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20.0,
                        children: [
                          ActionCard(
                            icon:Image.asset('assets/pitchfork.png', height: 50,),
                            data:dashBoard.totalHardware,
                            title: 'Total Hardware',
                          ),
                          ActionCard(
                            icon: Image.asset('assets/fertilizer.png', height: 50,),
                            data: dashBoard.totalFertilizer,
                            title: 'Total Fertilizers',
                          ),
                          ActionCard(
                              icon: Image.asset('assets/insecticide.png', height: 50,),
                              data: dashBoard.totalPesticites,
                              title: 'Total Pesticides',
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     new MaterialPageRoute(
                                //         builder: (context) => Timeline()));
                              }),
                          ActionCard(
                              icon: Image.asset('assets/seeds.png', height: 50,),
                              data: dashBoard.totalSeeds,
                              title: 'Total Seeds',
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     new MaterialPageRoute(
                                //         builder: (context) => Timeline()));
                              }),
                        ],
                      ),
                    ),
                  ],
                )
                //   }
                // }),
                ));
  }
}

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final Image icon;
  final String title;
  final int data;

  const ActionCard({Key key, this.onPressed, this.icon, this.title, this.data})
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
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only( left: 15, top: 15),
                  height: 70,
                  child: Tab(
                    child: icon,
                  ),
                ),
                Container(
                  height: 75,
                  padding: EdgeInsets.only(right: 15, left: 15, top: 15),
                  child: Text(
                    data.toString(),
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 8,
            // ),
            Container(
                padding: EdgeInsets.only(
                right: 15,
                left: 15,
              ),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 18,
                //fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionCardLong extends StatelessWidget {
  final Function onPressed;
  final IconData icon;

  final int user;
  final String title;

  const ActionCardLong(
      {Key key, this.icon, this.onPressed, this.user, this.title})
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
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AgrocartUniversal.contrastColorLight,
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(color: Color(0xfff8bc05))
            boxShadow: AgrocartUniversal.customBoxShadow),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 15, left: 15, top: 15),
                  height: 70,
                  child: Icon(
                    icon,
                    size: 50,
                    color: AgrocartUniversal.contrastColor,
                  ),
                ),
                Container(
                  height: 75,
                  padding: EdgeInsets.only(right: 15, top: 15),
                  child: Text(
                    user.toString(),
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 8,
            // ),
            Container(
              padding: EdgeInsets.only(
                right: 15,
                left: 15,
              ),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
