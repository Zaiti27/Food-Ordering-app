import 'package:flutter/material.dart';
import '../helpers/categorie.dart';
import '../models/Categorie.dart';

class CategorieProvider with ChangeNotifier {
  CategorieService _categorieService = CategorieService();

  List<Categorie> categories = [];
  CategorieProvider.initialize() {
    _loadCategories();
  }
  _loadCategories() async {
    categories = await _categorieService.getCategories();
    notifyListeners();
  }
}
