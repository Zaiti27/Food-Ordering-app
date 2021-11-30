import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/src/models/CartItem.dart';

class UserModel {
  static const NAME = "name";
  static const EMAIL = "email";
  static const ID = "id";
  static const PHONE = "phone";
  static const PASSWORD = "password";
  static const LIKED_FOOD = "likedFood";
  static const CARTITEM = "cartItem";
  static const ORDERS = "orders";
  String _name;
  String _email;
  String _id;
  String _password;
  String _phone;
  List _likedFood;
  List _orders;

// getters
  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get id => _id;
  String get phone => _phone;
  List get likedFood => _likedFood;
  List get orders => _orders;

  UserModel(
    this._email,
    this._id,
    this._name,
    this._password,
    this._phone,
  );
  //
  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _id = snapshot.data[ID];
    _phone = snapshot.data[PHONE];
    //_favoris = snapshot.data[FAVORIS];
    _password = snapshot.data[PASSWORD];
    _likedFood = snapshot.data[LIKED_FOOD];
    _orders = snapshot.data[ORDERS];
  }
}
