import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String name;
  String price;
  String about;
  String weight;
  String number;
  String image;
  String category;
  String company;
  String productID;
  Timestamp createdAt;
  Timestamp updatedAt;
  String firstChar;

  Product();

  Product.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    price = data['price'];
    about = data['about'];
    weight = data['weight'];
    number = data['number'];
    image = data['image'];
    category = data['category'];
    company = data['company'];
    productID = data['productID'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
    firstChar = data['firstChar'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'about': about,
      'weight': weight,
      'number': number,
      'image': image,
      'category': category,
      'company' : company,
      'productID': productID,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'firstChar': firstChar,
    };
  }
}
