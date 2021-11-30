import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/helpers/cartItem.dart';
import 'package:flutter_application_1/src/models/CartItem.dart';
import 'package:flutter_application_1/src/models/Product.dart';
import 'package:flutter_application_1/src/models/user.dart';

class CartItemProvider with ChangeNotifier {
  CartItemService _cartItemService = CartItemService();
  List<UserModel> users = [];
  List<CartItemModel> cartItemsByProduct = [];
  List<CartItemModel> cartItemsByUser = [];
  List<CartItemModel> cartItems = [];

  CartItemProvider.initialize() {
    loadCartItems();
    loadProductsCartItems();
    loadUserCartItems();
  }
  loadCartItems() async {
    cartItems = await _cartItemService.getCartItems();
    notifyListeners();
  }

  loadProductsCartItems({int productId}) async {
    cartItemsByProduct =
        await _cartItemService.getCartItemByProductId(productId: productId);
    notifyListeners();
  }

  loadUserCartItems({int userId}) async {
    cartItemsByProduct =
        await _cartItemService.getCartItemByUserId(userId: userId);
    notifyListeners();
  }
}
