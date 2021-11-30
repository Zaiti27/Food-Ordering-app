import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/helpers/screen_navigation.dart';
import 'package:flutter_application_1/src/helpers/stars.dart';
import 'package:flutter_application_1/src/models/Product.dart';
import 'package:flutter_application_1/src/providers/Product.dart';
import 'package:flutter_application_1/src/screens/details.dart';
import 'package:flutter_application_1/src/widgets/custom_text.dart';
import 'package:flutter_application_1/src/widgets/productsCategorie.dart';
import 'package:provider/provider.dart';

class CategorieProductScreen extends StatelessWidget {
  final String categorie;

  const CategorieProductScreen(this.categorie);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: this.categorie,
          color: Colors.white,
          size: 22,
          weight: FontWeight.bold,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.red[600],
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
      body: Container(
        //height: 500,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          //height: 500,
          //width: MediaQuery.of(context).size.width,
          body: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: productProvider.productsByCategorie.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    changeScreen(
                        _,
                        Details(
                          product: productProvider.productsByCategorie[index],
                        ));
                  },
                  child: ProductCategorie(
                      productProvider.productsByCategorie[index]),
                );
              }),
        ),
      ),
    );
  }
}
