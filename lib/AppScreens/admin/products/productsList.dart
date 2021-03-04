import 'package:agrocart/AppScreens/admin/products/product.dart';
import 'package:agrocart/backend/api/product_api.dart';
import 'package:agrocart/backend/notifier/product_notifier.dart';
import 'package:agrocart/utils/agrocart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String id;
Icon filter = new Icon(Icons.sort);
bool chipSelected = false;
bool dataGot = false;

class ProductsCom extends StatefulWidget {
  final String depname;
  const ProductsCom({
    Key key,
    this.depname,
  });

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<ProductsCom> {
  Icon searchIcon = new Icon(Icons.search);
  List<String> chipList = ["Maths", "Computer", "Physics", "Elective"];
  // Animation animation, transformationAnim;
  // AnimationController animationController;

  //var queryResultSet = [];
  // void initState() {
  //   print(widget.depname);
  //   BookNotifier foodNotifier =
  //       Provider.of<BookNotifier>(context, listen: false);
  //   //getBooks(foodNotifier, widget.depname);
  //   super.initState();
  //   //   animationController =
  //   //       AnimationController(duration: Duration(seconds: 8), vsync: this);

  //   //   animation = Tween(begin: 10.0, end: 200.0).animate(
  //   //       CurvedAnimation(parent: animationController, curve: Curves.ease));

  //   //   transformationAnim = BorderRadiusTween(
  //   //           begin: BorderRadius.circular(150.0),
  //   //           end: BorderRadius.circular(0.0))
  //   //       .animate(
  //   //           CurvedAnimation(parent: animationController, curve: Curves.ease));
  //   //   animationController.forward();
  // }


  // var tempSearchStore = [];

  // initiateSearch(value){
  //   if(value.length == 0){
  //     setState(() {
  //       queryResultSet = [];
  //       tempSearchStore = [];
  //     });
  //   }

  // var capitalizedValue = value.substring(0, 1).toUpperCase() + value.substring(1);

  // if(queryResultSet.length == 0 && value.length == 1){
  //   searchService().searchByName(value).then( (QuerySnapshot docs){
  //     for(int i = 0; i<docs.documents.length; i++){
  //       queryResultSet.add(docs.documents[i].data);
  //     }
  //   });

  // }else{
  //     tempSearchStore = [];
  //     queryResultSet.forEach((element){
  //       if(element['title'].startsWith(capitalizedValue)){
  //         setState(() {
  //           tempSearchStore.add(element);
  //         });
  //       }
  //     });
  //   }

  // }

  @override
  Widget build(BuildContext context) {
    BookNotifier foodNotifier = Provider.of<BookNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Products",
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,

            // fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: new IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
              icon: searchIcon,
              color: Colors.black,
              onPressed: () {
                //showSearch(context: context, delegate: DataSearch());
                //initiateSearch(value);
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Search()));
              }),
          // FilterIcon(),
          IconButton(
            icon: filter,
            onPressed: () => _onButtonPressed(widget.depname),
          )
        ],
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
            // foodNotifier.currentBook = null;
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body:
          //dataGot == false ? Center(child: CircularProgressIndicator()) :
          Padding(
        padding: const EdgeInsets.all(15.0),
        child:
            //foodNotifier.bookList.length == 0 ? Center(child: Text('No Data')):
            FutureBuilder(
                future: getBooks(foodNotifier, widget.depname),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData != true) {
                    return CircularProgressIndicator();
                  } else {
                    return foodNotifier.bookList.length == 0 ? Center(child: Text('No Data')): GridView.builder(
                      itemCount: foodNotifier.bookList.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.70,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            foodNotifier.currentBook =
                                foodNotifier.bookList[index];
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return ThingForEdit();
                            }));
                          },
                          child: Ink(
                            height: (MediaQuery.of(context).size.width / 2),
                            width: (MediaQuery.of(context).size.width / 2),
                            decoration: BoxDecoration(
                              boxShadow: AgrocartUniversal.customBoxShadow,
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  // padding: EdgeInsets.only(top: 15),
                                  child: Stack(children: <Widget>[
                                    Container(
                                      height: 190.0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: FadeInImage.assetNetwork(
                                          fit: BoxFit.cover,
                                          image: foodNotifier
                                              .bookList[index].image,
                                          placeholder: 'assets/yello.jpg',
                                        ),

                                        // Image.network(
                                        //      foodNotifier.bookList[index].image != null
                                        //       ? foodNotifier.bookList[index].image
                                        //       : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                                        //       fit: BoxFit.cover,
                                        // ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0)),
                                      ),
                                    )
                                  ]),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    foodNotifier.bookList[index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    '₹ ${foodNotifier.bookList[index].price}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      physics: ClampingScrollPhysics(),
                    );
                  }
                }),
      ),
    );
  }

  void _onButtonPressed(String dpname) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: ChoiceChipWidget(chipList, dpname),
          );
        });
  }
}

String selectedChoice = "";

class ChoiceChipWidget extends StatefulWidget {
  final List<String> reportList;
  final String dpname;

  ChoiceChipWidget(this.reportList, this.dpname);

  @override
  _ChoiceChipWidgetState createState() => new _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  _buildChoiceList(BookNotifier foodnotifier) {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: ChoiceChip(
          elevation: 5,
          selectedShadowColor: Colors.deepPurple,
          labelPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          label: Text(item),
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Colors.grey,
          selectedColor: Colors.deepPurple,
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              getBooksForFilter(foodnotifier, widget.dpname, selectedChoice);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    BookNotifier foodNotifier =
        Provider.of<BookNotifier>(context, listen: false);
    return Column(
      children: [
        Wrap(
          children: _buildChoiceList(foodNotifier),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          width: 60,
          height: 60,
          decoration: new BoxDecoration(
            color: Colors.deepPurple,
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.deepPurple,
                offset: Offset(1.0, 6.0),
                blurRadius: 30.0,
                spreadRadius: -5,
              )
            ],
          ),
          child: IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop()),
        )
      ],
    );
  }
}
