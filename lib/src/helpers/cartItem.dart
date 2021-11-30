import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/src/models/CartItem.dart';
import 'package:flutter_application_1/src/models/Product.dart';

class CartItemService {
  String collection = "cartItems";
  Firestore _firestore = Firestore.instance;
  //add cartItem
  void createCartItem(Map<String, dynamic> values) {
    String id = values["id"];
    _firestore.collection(collection).document(id).setData(values);
  }

  //get all cartItems
  Future<List<CartItemModel>> getCartItems() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<CartItemModel> cartItems = [];
        for (DocumentSnapshot cartItem in result.documents) {
          cartItems.add(CartItemModel.fromSnapshot(cartItem));
        }
        return cartItems;
      });

  //update cartItem
  void updateCartItemrData(Map<String, dynamic> values) {
    _firestore.collection(collection).document(values['id']).updateData(values);
  }

  //delete cartItem
  void deleteCartItemrData(Map<String, dynamic> values) {
    _firestore.collection(collection).document(values['id']).delete();
  }

  //get cartitems by id
  Future<CartItemModel> getCartItemById(String id) =>
      _firestore.collection(collection).document(id).get().then((doc) {
        return CartItemModel.fromSnapshot(doc);
      });
  //get cartitems by user id
  Future<List<CartItemModel>> getCartItemByUserId({int userId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<CartItemModel> cartItems = [];
        for (DocumentSnapshot cartItem in result.documents) {
          cartItems.add(CartItemModel.fromSnapshot(cartItem));
        }
        return cartItems;
      });
  //get cartitems by product id
  Future<List<CartItemModel>> getCartItemByProductId({int productId}) async =>
      _firestore
          .collection(collection)
          .where("productId", isEqualTo: productId)
          .getDocuments()
          .then((result) {
        List<CartItemModel> cartItems = [];
        for (DocumentSnapshot cartItem in result.documents) {
          cartItems.add(CartItemModel.fromSnapshot(cartItem));
        }
        return cartItems;
      });
}
