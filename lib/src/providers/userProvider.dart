import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/helpers/order.dart';
import 'package:flutter_application_1/src/helpers/user.dart';
import 'package:flutter_application_1/src/models/CartItem.dart';
import 'package:flutter_application_1/src/models/Product.dart';
import 'package:flutter_application_1/src/models/orders.dart';
import 'package:flutter_application_1/src/models/user.dart';
import 'package:uuid/uuid.dart';

enum Status { Uninitilaized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitilaized;
  Firestore _firestore = Firestore.instance;
  UserModel _userModel;
  UserServices _userServicse = UserServices();
  OrederServices _orderServices = OrederServices();
  UserModel get userModel => _userModel;
  Status get status => _status;
  FirebaseUser get user => _user;

  //public var

  final formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  List<OrderModel> orders = [];

  //Constructor
  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }
  //reload user model
  Future<void> reloadUserModel() async {
    _userModel = await _userServicse.getUserById(user.uid);
    notifyListeners();
  }

// _onStateChanged
  Future<void> _onStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      // _userModel = await _userServicse.getUserById(user.uid);
    }
    notifyListeners();
  }

// Sign in
  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

// Sign Up
  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((user) {
        Map<String, dynamic> values = {
          "name": name.text,
          "email": email.text,
          "id": user.user.uid,
          "phone": phone.text,
          "password": password.text,
          "likedFood": [],
          "orders": [],
        };
        _userServicse.createUser(values);
      });

      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

//Sign out
  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
  //General methods

  bool _onError(String error) {
    _status = Status.Unauthenticated;
    notifyListeners();
    print("we got an error" + error);
    return false;
  }

  void cleanContorollers() {
    email.text = "";
    password.text = "";
    name.text = "";
    phone.text = "";
  }

  //requiper les ordres
  getOrders() async {
    orders = await _orderServices.getUserOrders(userId: _user.uid);
    notifyListeners();
  }
}
