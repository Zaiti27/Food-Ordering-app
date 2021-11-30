import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Categorie {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";
  String _name;
  String _image;
  int _id;

  //getters
  int get id => _id;
  String get image => _image;
  String get name => _name;

//constructor
  Categorie.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
  }
}
