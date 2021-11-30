import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartItemModel {
  static const ID = "id";
  static const PRODUCT_ID = "productId";
  static const PRIX = "prix";
  static const Quantity = "quantity";
  static const User_ID = "userId";
  static const IMAGE = "image";
  static const NAME = "name";
  static const TOTAL = "total";

  int _productId;
  int _prix;
  int _quantity;
  int _id;
  int _total;
  String _userId;
  String _image;
  String _name;

  //getters
  int get id => _id;
  int get prix => _prix;
  int get total => _total;
  int get quantity => _quantity;
  String get userId => _userId;
  int get productId => _productId;
  String get image => _image;
  String get name => _name;

//constructor
  CartItemModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _quantity = snapshot.data[Quantity];
    _prix = snapshot.data[PRIX];
    _userId = snapshot.data[User_ID];
    _productId = snapshot.data[PRODUCT_ID];
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
    _total = snapshot.data[TOTAL];
  }

  CartItemModel.fromMap(Map data) {
    _id = data[ID];
    _quantity = data[Quantity];
    _userId = data[User_ID];
    _productId = data[PRODUCT_ID];
    _prix = data[PRIX];
    _name = data[NAME];
    _image = data[IMAGE];
    _total = data[TOTAL];
  }
  Map toMap() => {
        ID: _id,
        Quantity: _quantity,
        PRIX: _prix,
        PRODUCT_ID: _productId,
        User_ID: _userId,
        NAME: _name,
        IMAGE: _image,
        TOTAL: _total
      };
}
