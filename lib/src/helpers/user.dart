import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/src/models/CartItem.dart';
import 'package:flutter_application_1/src/models/user.dart';

class UserServices {
  String collection = "users";
  Firestore _firestore = Firestore.instance;

//create user
  void createUser(Map<String, dynamic> values) {
    String id = values["id"];
    _firestore.collection(collection).document(id).setData(values);
  }

  //update user data
  void updateUserData(Map<String, dynamic> values) {
    _firestore.collection(collection).document(values['id']).updateData(values);
  }

//add cartItem
  void addToCart({String userId, CartItemModel cartItem}) {
    print("THE USER ID IS: $userId");
    print("cart items are: ${cartItem.toString()}");
    _firestore.collection(collection).document(userId).updateData({
      "cartItem": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

//delete cartItem
  void removeFromCart({String userId, CartItemModel cartItem}) {
    print("THE USER ID IS: $userId");
    print("cart items are: ${cartItem.toString()}");
    _firestore.collection(collection).document(userId).updateData({
      "cartItem": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }

// get user by id
  Future<UserModel> getUserById(String id) =>
      _firestore.collection(collection).document(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });
}
