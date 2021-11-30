import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";
  //static const RATING = "rating";
  static const PRICE = "price";
  static const POPLUAIRE = "populaire";
  static const RATES = "rates";
  static const CATEGIRIE = "categorie";

//getters
  String _name;
  int _id;
  int _rates;
  int _price;
  bool _populaire;
  //double _rating;
  String _image;
  String _categorie;

  //getters
  int get id => _id;
  int get price => _price;
  bool get populaire => _populaire;
  //double get rating => _rating;
  int get rates => _rates;
  String get name => _name;
  String get categorie => _categorie;
  String get image => _image;
//constructor
  Product.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _price = snapshot.data[PRICE];
    _populaire = snapshot.data[POPLUAIRE];
    // _rating = snapshot.data[RATING];
    _rates = snapshot.data[RATES];
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
    _categorie = snapshot.data[CATEGIRIE];
  }
}
