import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/Product.dart';

/*List<Product> listProducts = [
  Product(
      name: "Magret",
      image: "magret.jpeg",
      rating: 2.3,
      price: 10.0,
      vendor: "monte",
      wishlist: true),
  Product(
      name: "Fondant",
      image: "fondant.jpeg",
      rating: 2.3,
      price: 11,
      vendor: "monte",
      wishlist: false),
  Product(
      name: "Cruvette",
      image: "cruvette.jpg",
      rating: 2.3,
      price: 10.0,
      vendor: "monte",
      wishlist: true),
];*/

class BagItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        /*itemCount: listProducts.length,*/
        itemBuilder: (_, index) {},
      ),
    );
  }
}
