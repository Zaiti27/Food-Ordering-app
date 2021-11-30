import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/helpers/screen_navigation.dart';
import 'package:flutter_application_1/src/models/Product.dart';
import 'package:flutter_application_1/src/providers/Product.dart';
import 'package:flutter_application_1/src/providers/userProvider.dart';
import 'package:flutter_application_1/src/widgets/custom_text.dart';
import 'package:flutter_application_1/src/widgets/smallButton.dart';
import 'package:flutter_application_1/src/widgets/smallButton.dart';
import 'package:flutter_application_1/src/widgets/smallButton.dart';
import 'package:flutter_application_1/src/screens/bag.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  final Product product;

  const Details({@required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int quantity = 0;
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    final user = Provider.of<UserProvider>(context);
    //final app = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Stack(
                children: [
                  Carousel(
                    images: [
                      NetworkImage(widget.product.image),
                      NetworkImage(widget.product.image),
                      NetworkImage(widget.product.image),
                    ],
                    dotBgColor: Colors.white,
                    dotColor: Colors.grey,
                    dotIncreasedColor: Colors.red[600],
                    dotIncreaseSize: 1.5,
                    autoplay: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 15.0, 12.0, 8),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Stack(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.shopping_bag,
                                  color: Colors.red[500],
                                  size: 35,
                                ),
                                onPressed: () {
                                  changeScreen(context, ShopingBag());
                                },
                              ),
                              Positioned(
                                top: 20,
                                right: 5,
                                child: Container(
                                  height: 22,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 16,
                                          offset: Offset(4, 2),
                                          color: Colors.red[200]),
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 6.0,
                                        right: 6,
                                        bottom: 2.5,
                                        top: 2),
                                    child: CustomText(
                                      text: "2",
                                      color: Colors.red[600],
                                      size: 18,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    right: 5,
                    top: 146,
                    child: SmallButton(Icons.favorite, 30, 30, Colors.white, 20,
                        20, Colors.red),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 16,
                      offset: Offset(1, 1),
                      color: Colors.grey[200]),
                ],
              ),
              child: Container(
                height: 70,
                width: 390,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: widget.product.name + "\n",
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text: "by ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text: "Pino ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ], style: TextStyle(color: Colors.black)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, right: 5),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    (widget.product.price).toString() + "DA \n",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.red[600],
                      iconSize: 40,
                      onPressed: () {
                        setState(() {
                          quantity += 1;
                        });
                      }),
                ),
                GestureDetector(
                  onTap: () async {},
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.red[600],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Ajouter $quantity au panier",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(Icons.remove),
                      color: Colors.red[600],
                      iconSize: 40,
                      onPressed: () {
                        if (quantity != 1) {
                          setState(() {
                            quantity -= 1;
                          });
                        }
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
