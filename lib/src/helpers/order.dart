import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/src/models/CartItem.dart';
import 'package:flutter_application_1/src/models/orders.dart';

class OrederServices {
  String collection = "orders";
  Firestore _firestore = Firestore.instance;
//vreate order
  void createOrder(
      {String userId,
      String id,
      int total,
      String status,
      int amount,
      List<CartItemModel> cart,
      int totalPrice}) {
    List<Map> convertedCart = [];

    for (CartItemModel item in cart) {
      convertedCart.add(item.toMap());
    }

    _firestore.collection(collection).document(id).setData({
      "userId": userId,
      "id": id,
      "cartItems": convertedCart,
      "total": totalPrice,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "status": status,
      "amount": amount
    });
  }

  //réquiperer les orders
  Future<List<OrderModel>> getUserOrders({String userId}) async => _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });
}
