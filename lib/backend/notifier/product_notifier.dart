import 'dart:collection';
import 'package:agrocart/backend/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class BookNotifier with ChangeNotifier {
  List<Product> _bookList = [];
  Product _currentBook;

  UnmodifiableListView<Product> get bookList => UnmodifiableListView(_bookList);
  Product get currentBook => _currentBook;

  set bookList(List<Product> bookList) {
    _bookList = bookList;
    notifyListeners();
  }

  addBook(Product book) {
    _bookList.insert(0, book);
    notifyListeners();
  }

  set currentBook(Product book) {
    _currentBook = book;
    notifyListeners();
  }

  deleteFood(Product food) {
    _bookList.removeWhere((_food) => _food.productID == food.productID);
    notifyListeners();
  }
}
