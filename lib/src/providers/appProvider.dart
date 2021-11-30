import 'package:flutter/material.dart';

enum SearchBy { NAME, CATEGORIE }

class AppProvider with ChangeNotifier {
  String filteredBy = "nom";
  SearchBy search = SearchBy.NAME;
  int totalPrice = 0;
  int priceSum = 0;
  int quantitySum = 0;

  AppProvider.initialize() {}
//pour le filtre
  void changeSearchBy({SearchBy newSearchBy}) {
    search = newSearchBy;
    if (newSearchBy == SearchBy.NAME) {
      filteredBy = "nom";
    } else {
      filteredBy = "categorie";
    }
    notifyListeners();
  }

  //ajouter prix aux existants
  addPrice({int newPrice}) {
    priceSum += newPrice;
    notifyListeners();
  }

  //ajouter les quantités
  addQuantity({int newQuantity}) {
    quantitySum += newQuantity;
    notifyListeners();
  }

  //total
  getTotalPrice() {
    totalPrice = priceSum * quantitySum;
    notifyListeners();
  }
}
