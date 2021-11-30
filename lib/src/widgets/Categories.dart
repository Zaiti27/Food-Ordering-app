import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/helpers/screen_navigation.dart';
import 'package:flutter_application_1/src/providers/Product.dart';
import 'package:flutter_application_1/src/providers/categorie.dart';
import 'package:flutter_application_1/src/screens/CategorieProductScreen.dart';
import 'package:flutter_application_1/src/widgets/custom_text.dart';
import 'package:flutter_application_1/src/models/Categorie.dart';
import 'package:provider/provider.dart';

/*List<Categorie> listCategories = [
  Categorie(name: "sandwich", image: "sandwich.jpg"),
  Categorie(name: "pizza", image: "pizza.jpg"),
  Categorie(name: "jus", image: "jus.png"),
  Categorie(name: "plat", image: "plat.png"),
  Categorie(name: "dessert", image: "dessert.png"),
  Categorie(name: "Tacos", image: "taco.png")
];*/

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categorieProvider = Provider.of<CategorieProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorieProvider.categories.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () async {
              await productProvider.loadProductsByCategory(
                  categorie: categorieProvider.categories[index].name);
              changeScreen(
                  context,
                  CategorieProductScreen(
                      categorieProvider.categories[index].name));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.pink[100],
                            offset: Offset(3, 6),
                            blurRadius: 15),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            categorieProvider.categories[index].image,
                            width: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: categorieProvider.categories[index].name,
                    size: 16,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
