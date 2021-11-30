import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/Product.dart';

class ProductService {
  String collection = "products";
  Firestore _firestore = Firestore.instance;

  Future<List<Product>> getProducts() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<Product> products = [];
        for (DocumentSnapshot product in result.documents) {
          products.add(Product.fromSnapshot(product));
        }
        return products;
      });

  //get products by categorie
  Future<List<Product>> getProductsOfCategorie({String categorie}) async =>
      _firestore
          .collection(collection)
          .where("categorie", isEqualTo: categorie)
          .getDocuments()
          .then((result) {
        List<Product> products = [];
        for (DocumentSnapshot product in result.documents) {
          products.add(Product.fromSnapshot(product));
        }
        return products;
      });

  //get products in which rates>3
  Future<List<Product>> getProductsPopulaire() async => _firestore
          .collection(collection)
          .where("rates", isGreaterThanOrEqualTo: 3)
          .getDocuments()
          .then((result) {
        List<Product> products = [];
        for (DocumentSnapshot product in result.documents) {
          products.add(Product.fromSnapshot(product));
        }
        return products;
      });
  //research for products by name
  //get products in which rates>3
  Future<List<Product>> productResearchByName({String name}) {
    //String searchKey = name[0].toUpperCase() + name.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([name])
        .endAt([name + '\uf0ff'])
        .getDocuments()
        .then((result) {
          List<Product> products = [];
          for (DocumentSnapshot product in result.documents) {
            products.add(Product.fromSnapshot(product));
          }
          return products;
        });
  }

  //get products categorie
  Future<List<Product>> productResearchByCategorie({String categorie}) {
    //String searchKey = name[0].toUpperCase() + name.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("categorie")
        .startAt([categorie])
        .endAt([categorie + '\uf0ff'])
        .getDocuments()
        .then((result) {
          List<Product> products = [];
          for (DocumentSnapshot product in result.documents) {
            products.add(Product.fromSnapshot(product));
          }
          return products;
        });
  }
}
