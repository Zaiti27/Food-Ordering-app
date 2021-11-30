import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/Categorie.dart';

class CategorieService {
  String collection = "categories";
  Firestore _firestore = Firestore.instance;
  Future<List<Categorie>> getCategories() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<Categorie> categories = [];
        for (DocumentSnapshot categorie in result.documents) {
          categories.add(Categorie.fromSnapshot(categorie));
        }
        return categories;
      });
}
