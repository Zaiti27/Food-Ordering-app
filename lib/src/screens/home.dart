import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/helpers/screen_navigation.dart';
import 'package:flutter_application_1/src/providers/Product.dart';
import 'package:flutter_application_1/src/providers/appProvider.dart';
import 'package:flutter_application_1/src/providers/categorie.dart';
import 'package:flutter_application_1/src/providers/userProvider.dart';
import 'package:flutter_application_1/src/screens/Account.dart';
import 'package:flutter_application_1/src/screens/Notifications.dart';
import 'package:flutter_application_1/src/screens/bag.dart';
import 'package:flutter_application_1/src/screens/details.dart';
import 'package:flutter_application_1/src/screens/productSearch.dart';
import 'package:flutter_application_1/src/widgets/ProductsRating.dart';
import 'package:flutter_application_1/src/widgets/bottom_navigation_icons.dart';
import 'package:flutter_application_1/src/widgets/imageButtonBarNav.dart';
import 'package:flutter_application_1/src/widgets/products.dart';
import 'package:flutter_application_1/src/widgets/smallButton.dart';
import 'package:provider/provider.dart';
import '../widgets/Categories.dart';
import '../widgets/custom_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);
    final categorieProvider = Provider.of<CategorieProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 16,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.red[600],
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CustomText(
            text: "FoodApp",
            color: Colors.white,
            size: 22,
            weight: FontWeight.bold,
          ),
        ),
        actions: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 12),
                child: IconButton(
                    icon: Icon(
                      Icons.notifications,
                    ),
                    iconSize: 30.0,
                    onPressed: () {
                      changeScreen(context, Notifications());
                    }),
              ),
              Positioned(
                top: 18,
                right: 23,
                child: Container(
                  width: 11,
                  height: 11,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white),
                    /*boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(2, 2),
                          blurRadius: 20),
                    ],*/
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      //drawer

      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            /*SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 3,
            ),*/
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[400],
                        offset: Offset(1, 1),
                        blurRadius: 4),
                  ],
                ),
                child: ListTile(
                    leading: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.red[600],
                    ),
                    title: TextField(
                      textInputAction: TextInputAction.search,
                      onSubmitted: (pattern) async {
                        if (appProvider.search == SearchBy.NAME) {
                          await productProvider.searchByName(
                              productName: pattern);
                          changeScreen(context, ProductSearch());
                        } else if (appProvider.search == SearchBy.CATEGORIE) {
                          await productProvider.searchByCategorie(
                              categorie: pattern);
                          changeScreen(context, ProductSearch());
                        }
                      },
                      cursorColor: Colors.red[600],
                      style: TextStyle(fontSize: 19),
                      decoration: InputDecoration(
                        hintText: "Trouvez plats et restaurants",
                        border: InputBorder.none,
                      ),
                    ),
                    trailing: DropdownButton<SearchBy>(
                      icon: Icon(
                        Icons.filter_list,
                        size: 30,
                        color: Colors.red[600],
                      ),
                      onChanged: (value) {
                        if (value == "Par nom") {
                          appProvider.changeSearchBy(
                              newSearchBy: SearchBy.NAME);
                        } else {
                          appProvider.changeSearchBy(
                              newSearchBy: SearchBy.CATEGORIE);
                        }
                      },
                      /*items: <String>["Par nom", "Par categorie"].map<DropdownMenuItem<String>>(f),*/
                    )
                    /**/
                    ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Categories(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomText(
                text: "En vedette",
                size: 20,
                color: Colors.grey,
              ),
            ),
            Products(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Populaire",
                color: Colors.grey,
                size: 20,
              ),
            ),
            //Populaire produits
            Column(
              children: productProvider.productsPopulaire
                  .map((e) => GestureDetector(
                        onTap: () async {
                          await productProvider.loadProductsPopulaire();

                          changeScreen(
                              context,
                              Details(
                                product: e,
                              ));
                        },
                        child: ProductsPopulaire(e),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BottomNavIcons(
              "accueil.png",
              35,
              35,
              () {
                changeScreen(
                  context,
                  Home(),
                );
              },
            ),
            BottomNavIcons(
              "target.png",
              35,
              35,
              () {},
            ),
            BottomNavIcons(
              "shooping.png",
              35,
              35,
              () {
                changeScreen(context, ShopingBag());
              },
            ),
            BottomNavIcons(
              "user.png",
              25,
              25,
              () {
                changeScreen(context, Account());
              },
            ),
          ],
        ),
      ),
    );
  }
}
