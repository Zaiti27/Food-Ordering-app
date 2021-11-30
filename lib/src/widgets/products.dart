import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/helpers/screen_navigation.dart';
import 'package:flutter_application_1/src/helpers/stars.dart';
import 'package:flutter_application_1/src/models/Product.dart';
import 'package:flutter_application_1/src/providers/Product.dart';
import 'package:flutter_application_1/src/screens/details.dart';
import 'package:flutter_application_1/src/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Container(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productProvider.products.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  changeScreen(
                      _,
                      Details(
                        product: productProvider.products[index],
                      ));
                },
                child: Container(
                  height: 220,
                  width: 280,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.pink[50],
                          offset: Offset(2, 4),
                          blurRadius: 30),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        productProvider.products[index].image,
                        height: 180,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: productProvider.products[index].name,
                              size: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[400],
                                      offset: Offset(1, 1),
                                      blurRadius: 4),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: productProvider.products[index].populaire
                                    ? Icon(
                                        Icons.favorite,
                                        size: 17,
                                        color: Colors.red,
                                      )
                                    : Icon(
                                        Icons.favorite_border,
                                        size: 17,
                                        color: Colors.red,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  productProvider.products[index].rates
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              /* Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.red,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.red,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.red,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.red,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.grey,
                              ),*/
                              stars(productProvider.products[index].rates),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                text:
                                    "${productProvider.products[index].price.toString()} DA",
                                size: 15,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
