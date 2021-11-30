import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/helpers/screen_navigation.dart';
import 'package:flutter_application_1/src/providers/Product.dart';
import 'package:flutter_application_1/src/screens/details.dart';
import 'package:flutter_application_1/src/widgets/custom_text.dart';
import 'package:flutter_application_1/src/widgets/productsCategorie.dart';
import 'package:provider/provider.dart';

class ProductSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Résultats",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {}),
        ],
      ),
      body: productProvider.productSearchByName.length < 1
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    size: 24,
                    color: Colors.grey[400],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomText(
                    text: "Aucun produit trouvé",
                    color: Colors.grey[400],
                    size: 22,
                  ),
                ],
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: productProvider.productSearchByName.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    changeScreen(
                        _,
                        Details(
                          product: productProvider.productSearchByName[index],
                        ));
                  },
                  child: ProductCategorie(
                      productProvider.productSearchByName[index]),
                );
              }),
    );
  }
}
