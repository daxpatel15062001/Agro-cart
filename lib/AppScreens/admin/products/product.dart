import 'dart:core' as prefix1;
import 'dart:core';
import 'dart:ffi';
import 'package:agrocart/AppScreens/admin/add/addProduct.dart';
import 'package:agrocart/AppScreens/admin/products/dialouge.dart';
import 'package:agrocart/backend/api/product_api.dart';
import 'package:agrocart/backend/models/product_model.dart';
import 'package:agrocart/backend/notifier/product_notifier.dart';
import 'package:agrocart/utils/agrocart.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

Widget divider() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
    child: Container(
      width: 0.8,
    ),
  );
}

class ThingForEdit extends StatefulWidget {
  @override
  _ThingState createState() => _ThingState();
}

class _ThingState extends State<ThingForEdit> {
  Icon searchIcon = new Icon(Icons.search);
  Icon bookIcon = new Icon(Icons.bookmark);

  // void initState() {
  //   super.initState();
  //   BackButtonInterceptor.add(myInterceptor);
  // }

  // @override
  // void dispose() {
  //   BookNotifier foodNotifier =
  //       Provider.of<BookNotifier>(context, listen: false);
  //   foodNotifier.currentBook = null;
  //   // BackButtonInterceptor.remove(
  //   //   myInterceptor,
  //   // );

  //   super.dispose();
  // }

  // bool myInterceptor(
  //   bool stopDefaultButtonEvent,
  //   RouteInfo info,
  // ) {
  //   print("BACK BUTTON!"); // Do some stuff.
  //   BookNotifier foodNotifier =
  //       Provider.of<BookNotifier>(context, listen: false);
  //   foodNotifier.currentBook = null;
  //   Navigator.of(context).pop();
  //   return true;
  // }

  Future<bool> _disposee() async {
    BookNotifier foodNotifier = Provider.of<BookNotifier>(context, listen: false);
    foodNotifier.currentBook = null;
     Navigator.of(context).pop(true);
    return true;
    //return null;
  }

  @override
  Widget build(BuildContext context) {
    BookNotifier foodNotifier = Provider.of<BookNotifier>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    _onFoodDeleted(Product food) {
      Navigator.pop(context);
      foodNotifier.deleteFood(food);
    }

    // Widget imageCarousel = new Container(
    //     height: 330.0,
    //     child: Padding(
    //       padding: const EdgeInsets.only(top: 25.0),
    //       child: 
    //       Image.network(
    //         // foodNotifier.currentBook.image != null
    //         //     ? foodNotifier.currentBook.image
    //         //     :
    //             'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
    //       ),
    //     ));
    return  foodNotifier.currentBook == null ? Container() :  WillPopScope(
      onWillPop: _disposee,
          child: Scaffold(
        body:CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 345.0,
              floating: false,
              pinned: true,
              snap: false,
              leading: IconButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
              ),
              actions: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 16, right: 300),
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: 
                 Image.network(
            foodNotifier.currentBook.image != null
                ? foodNotifier.currentBook.image
                :
                'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
          ),
               // new ListView(children: <Widget>[imageCarousel]),
              ),
            ),
            SliverFixedExtentList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.only(bottom: 11),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      height: 50,
                      child: ListTile(
                        title: Text(foodNotifier.currentBook.name ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            )),
                        trailing:
                            Text('₹ ${foodNotifier.currentBook.price}' ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                )),
                        subtitle: Text(
                            foodNotifier.currentBook.weight.toString() ?? '',
                            style: TextStyle()),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 11, bottom: 11),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      height: 50,
                      child: ListTile(
                        title: Text('Description',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        subtitle: Text(foodNotifier.currentBook.about ?? '',
                            style: TextStyle()),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 11, bottom: 11),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      height: 70,
                      child: ListTile(
                        title: Text('Company',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        subtitle: Text(foodNotifier.currentBook.company ?? '',
                            style: TextStyle()),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 11, bottom: 11),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      height: 70,
                      child: ListTile(
                        title: Text('Contact here',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        subtitle: Text(
                            foodNotifier.currentBook.number.toString() ?? '',
                            style: TextStyle()),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 11, bottom: 11),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      height: 70,
                      child: ListTile(
                        leading: Icon(
                          Icons.redeem,
                          color: AgrocartUniversal.contrastColor,
                          size: 35,
                        ),
                        title: Text('Rewards can get from this product',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        subtitle: Text(

                            'Abhi k liye likha hai' ?? '',
                            style: TextStyle()),
                      ),
                    ),
                  ),

                  //SizedBox(height: 10,)
                ]),
                itemExtent: 150.0)
          ],
        ),
        bottomNavigationBar: Material(
          elevation: 15,
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            height: 55.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: width * 0.5,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Upload(
                                        isUpdating: true,
                                      )));
                        },
                        child: Text(
                          'EDIT',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      )),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: width * 0.5,
                    color: Colors.redAccent,
                    child: InkWell(
                      onTap: () async {
                        final action = await Dialogs.yesAbortDialog(
                            context,
                            'Confirm',
                            'Are you sure want to delete this Product?');
                        if (action == DialogAction.yes) {
                          setState(() {
                            deleteFood(foodNotifier.currentBook, _onFoodDeleted);
                            toast();
                          });
                        } else {
                          setState(() => Navigator.of(context).pop());
                        }
                      },
                      child: Text(
                        'DELETE',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void toast() {
    Fluttertoast.showToast(
        msg: "Book Deleted",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
