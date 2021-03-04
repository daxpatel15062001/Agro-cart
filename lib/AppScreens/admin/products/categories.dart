import 'package:agrocart/AppScreens/admin/products/productsList.dart';
import 'package:agrocart/universal/add_scaffold.dart';
import 'package:agrocart/utils/agrocart.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

QuerySnapshot object;
String pesticides = 'pesticides';
String fertilizer = 'fertilizers';
String seeds = 'seeds';
String hardware = 'hardware';

class Categories extends StatefulWidget {
  const Categories({Key key, this.ontap}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
  final VoidCallback ontap;
}

class _CategoriesState extends State<Categories> {
  Icon searchIcon = new Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return AddScaffold(
      title: 'Categories',
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductsCom(
                              depname: pesticides,
                            )));
              },
              child: Align(
                child: Ink(
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: AgrocartUniversal.customBoxShadow,
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                         child: Image.asset('assets/insecticide.png', height: 80,),
                         
                        //Icon(
                        //   Icons.category,
                        //   size: 50,
                        //   color: AgrocartUniversal.contrastColor,
                        // ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 7),
                        child: Text(
                          'Pesticides',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductsCom(
                              depname: fertilizer,
                            )));
              },
              child: Align(
                child: Ink(
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: AgrocartUniversal.customBoxShadow,
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Image.asset('assets/fertilizer.png', height: 80,),
                        // Icon(
                        //   Icons.category,
                        //   size: 50,
                        //   color: AgrocartUniversal.contrastColor,
                        // ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 7),
                        child: Text(
                          'Fertilizer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductsCom(depname: seeds)));
              },
              child: Align(
                child: Ink(
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: AgrocartUniversal.customBoxShadow,
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Image.asset('assets/seeds.png', height: 80,),
                        // Icon(
                        //   Icons.category,
                        //   size: 50,
                        //   color: AgrocartUniversal.contrastColor,
                        // ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 7),
                        child: Text(
                          'Seeds',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductsCom(depname: hardware)));
              },
              child: Align(
                child: Ink(
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: AgrocartUniversal.customBoxShadow,
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Image.asset('assets/pitchfork.png', height: 80,),
                        // Icon(
                        //   Icons.category,
                        //   size: 50,
                        //   color: AgrocartUniversal.contrastColor,
                        // ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 7),
                        child: Text(
                          'Hardware',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
