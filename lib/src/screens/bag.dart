import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/helpers/order.dart';
import 'package:flutter_application_1/src/models/Product.dart';
import 'package:flutter_application_1/src/providers/Product.dart';
import 'package:flutter_application_1/src/providers/appProvider.dart';
import 'package:flutter_application_1/src/providers/userProvider.dart';
import 'package:flutter_application_1/src/widgets/bagItem.dart';
import 'package:flutter_application_1/src/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class ShopingBag extends StatefulWidget {
  @override
  _ShopingBagState createState() => _ShopingBagState();
}

class _ShopingBagState extends State<ShopingBag> {
  final _key = GlobalKey<ScaffoldState>();
  OrederServices _orderServices = OrederServices();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Mes commandes",
          color: Colors.white,
          size: 22,
          weight: FontWeight.bold,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.shopping_bag,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    offset: Offset(3, 2),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(160),
                    child: Image.asset(
                      "images/jus.png",
                      height: 120,
                      width: 140,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "nom \n",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "prix DA \n\n",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: "Quantity: ",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: "quantite",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ], style: TextStyle(color: Colors.black)),
                          ),
                        ),
                        Positioned(
                            top: 20,
                            right: 5,
                            child: IconButton(
                                color: Colors.black,
                                iconSize: 30,
                                icon: Icon(Icons.delete),
                                onPressed: () async {})),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
