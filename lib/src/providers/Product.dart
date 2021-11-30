import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/Product.dart';
import '../helpers/product.dart';
import '../models/Product.dart';

class ProductProvider with ChangeNotifier {
  ProductService _productService = ProductService();
  List<Product> products = [];
  List<Product> productsByCategorie = [];
  List<Product> productsPopulaire = [];
  List<Product> productSearchByName = [];
  List<Product> productSearchByCategorie = [];

  ProductProvider.initialize() {
    loadProducts();
    loadProductsPopulaire();
    searchByName();
    searchByCategorie();
  }

  loadProducts() async {
    products = await _productService.getProducts();
    notifyListeners();
  }

  Future loadProductsByCategory({String categorie}) async {
    productsByCategorie =
        await _productService.getProductsOfCategorie(categorie: categorie);
    notifyListeners();
  }

  loadProductsPopulaire() async {
    productsPopulaire = await _productService.getProductsPopulaire();
    notifyListeners();
  }

  Future searchByName({String productName}) async {
    productSearchByName =
        await _productService.productResearchByName(name: productName);
    print("the names of product: ${productSearchByName.length}");
    notifyListeners();
  }

  Future searchByCategorie({String categorie}) async {
    productSearchByCategorie =
        await _productService.productResearchByCategorie(categorie: categorie);
    print("the categorie of product: ${productSearchByCategorie.length}");
    notifyListeners();
  }
}
