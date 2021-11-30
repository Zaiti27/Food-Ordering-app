import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/src/providers/userProvider.dart';

class OrderModel {
  static const ID = "id";
  static const USER_ID = "userId";
  static const CART_ITEMS = "cartItems";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const AMOUNT = "amount";
  static const CREATED_AT = "createdAt";
  String _id;
  int _total;
  String _status;
  int _amount;
  String _userId;
  int _createdAt;
  //getters
  String get id => _id;
  int get total => _total;
  String get status => _status;
  int get amount => _amount;
  String get userId => _userId;
  int get createdAt => _createdAt;
//variable pub
  List cartItems;
//constructor
  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    cartItems = snapshot.data[CART_ITEMS];
    _total = snapshot.data[TOTAL];
    _status = snapshot.data[STATUS];
    _amount = snapshot.data[AMOUNT];
    _userId = snapshot.data[USER_ID];
    _createdAt = snapshot.data[CREATED_AT];
  }
}
