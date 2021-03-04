import 'dart:io';
import 'package:agrocart/AppScreens/admin/add/addProduct.dart';
import 'package:agrocart/AppScreens/admin/products/productsList.dart';
import 'package:agrocart/backend/api/user_api.dart';
import 'package:agrocart/backend/models/dashboardModel.dart';
import 'package:agrocart/backend/models/product_model.dart';
import 'package:agrocart/backend/notifier/product_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;

uploadFoodAndImage(Product food, bool isUpdating, File localFile,
    Function foodUploaded) async {
  if (localFile != null) {
    print("uploading image");

    var fileExtension = path.extension(localFile.path);
    print(fileExtension);

    var uuid = Uuid().v4();

    final StorageReference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('books/images/$uuid$fileExtension');

    await firebaseStorageRef
        .putFile(localFile)
        .onComplete
        .catchError((onError) {
      print(onError);
      return false;
    });

    String url = await firebaseStorageRef.getDownloadURL();
    print("download url: $url");
    _uploadFood(food, isUpdating, foodUploaded, imageUrl: url);
  } else {
    print('...skipping image upload');
    _uploadFood(food, isUpdating, foodUploaded);
  }
}

_uploadFood(Product food, bool isUpdating, Function foodUploaded,
    {String imageUrl}) async {
  CollectionReference foodRef = FirebaseFirestore.instance
      .collection('Products')
      .doc('Categories')
      .collection(food.category);
  //User currentUser =  FirebaseAuth.instance.currentUser;
  if (imageUrl != null) {
    food.image = imageUrl;
  }

  if (isUpdating) {
    food.updatedAt = Timestamp.now();
    //food.userId = currentUser.uid;
    await foodRef.doc(food.productID).update(food.toMap()).whenComplete(() => 
    productUploaded = true,
    );

    foodUploaded(food);
    print('updated food with id: ${food.productID}');
  } else {
    String fChar = food.name[0];
    food.firstChar = fChar;
    print(fChar);
    food.createdAt = Timestamp.now();
    //food.userId = currentUser.uid;
    DocumentReference documentRef = await foodRef.add(food.toMap()).whenComplete(() => 
    productUploaded = true,
    );

    food.productID = documentRef.id;

    print('uploaded food successfully: ${food.toString()}');

    await documentRef.set(food.toMap(), SetOptions(merge: true));

    foodUploaded(food);
  }
}

deleteFood(Product food, Function foodDeleted) async {
  if (food.image != null) {
    StorageReference storageReference =
        await FirebaseStorage.instance.getReferenceFromUrl(food.image);

    print(storageReference.path);

    await storageReference.delete();

    print('image deleted');
  }

  await FirebaseFirestore.instance
      .collection(food.category)
      .doc(food.productID)
      .delete();
  foodDeleted(food);
}

getBooks(BookNotifier bookNotifier, String depname) async {
  //heroTag: 'harsh';
  //String dep = depname as String;
  //dataGot = false;
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Products')
      .doc('Categories')
      .collection(depname)
      .orderBy('createdAt', descending: true)
      .get();

  List<Product> _bookList = [];

  snapshot.docs.forEach((document) {
    Product book = Product.fromMap(document.data());
    _bookList.add(book);
  });

  bookNotifier.bookList = _bookList;
  return snapshot;
  //dataGot = true;
}

getBooksForFilter(
    BookNotifier bookNotifier, String depname, String filter) async {
  //heroTag: 'harsh';
  //String dep = depname as String;
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection(depname)
      .where('filter', isEqualTo: filter)
      .get();
  print('in Book_Api');
  print(snapshot);

  List<Product> _bookList = [];

  snapshot.docs.forEach((document) {
    Product book = Product.fromMap(document.data());
    _bookList.add(book);
  });

  bookNotifier.bookList = _bookList;
}

getProductCount(BookNotifier bookNotifier, String depname) async {
  //heroTag: 'harsh';
  //String dep = depname as String;
  //dataGot = false;
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Products')
      .doc('Categories')
      .collection(depname)
      .orderBy('createdAt', descending: true)
      .get();
  dashBoard.totalPesticites = snapshot.docs.length;
  return dashBoard.totalPesticites;
  //dataGot = true;
}

getProductCountFertilizer(BookNotifier bookNotifier, String depname) async {
  //heroTag: 'harsh';
  //String dep = depname as String;
  dataGot = false;
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Products')
      .doc('Categories')
      .collection(depname)
      .orderBy('createdAt', descending: true)
      .get();
  dashBoard.totalFertilizer = snapshot.docs.length;
  dataGot = true;
  return dashBoard.totalPesticites;
}

getProductCountSeeds(BookNotifier bookNotifier, String depname) async {
  //heroTag: 'harsh';
  //String dep = depname as String;
  //dataGot = false;
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Products')
      .doc('Categories')
      .collection(depname)
      .orderBy('createdAt', descending: true)
      .get();
  dashBoard.totalSeeds = snapshot.docs.length;
  return dashBoard.totalPesticites;
  //dataGot = true;
}

getProductCountHardware(BookNotifier bookNotifier, String depname) async {
  //heroTag: 'harsh';
  //String dep = depname as String;
  //dataGot = false;
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Products')
      .doc('Categories')
      .collection(depname)
      .orderBy('createdAt', descending: true)
      .get();
  dashBoard.totalHardware = snapshot.docs.length;
  return dashBoard.totalPesticites;
  //dataGot = true;
}
