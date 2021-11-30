import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/helpers/screen_navigation.dart';
import 'package:flutter_application_1/src/providers/userProvider.dart';
import 'package:flutter_application_1/src/screens/home.dart';
import 'package:flutter_application_1/src/screens/login.dart';
import 'package:flutter_application_1/src/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);

    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red[600],
            ),
            accountName: CustomText(
              text: authProvider.userModel.name,
              color: Colors.white,
              weight: FontWeight.bold,
              size: 22,
            ),
            accountEmail: CustomText(
              text: authProvider.userModel.email,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[50],
                    offset: Offset(1, 3),
                    blurRadius: 4),
              ],
            ),
            child: ListTile(
              onTap: () {
                changeScreen(context, Home());
              },
              leading: Image.asset(
                "images/home.png",
                width: 25,
                height: 25,
                color: Colors.red[500],
              ),
              title: CustomText(
                text: "Accueil ",
                color: Colors.grey[500],
                size: 22,
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[50],
                    offset: Offset(1, 3),
                    blurRadius: 4),
              ],
            ),
            child: ListTile(
              onTap: () {},
              leading: Image.asset(
                "images/settings.png",
                width: 22,
                height: 22,
                color: Colors.red[500],
              ),
              title: CustomText(
                text: "Paramètres",
                size: 22,
                color: Colors.grey[500],
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[50],
                    offset: Offset(1, 3),
                    blurRadius: 4),
              ],
            ),
            child: ListTile(
              onTap: () {},
              leading: Image.asset(
                "images/nourriture-et-restaurant.png",
                width: 30,
                height: 35,
                color: Colors.red[500],
              ),
              title: CustomText(
                text: "Favoris",
                color: Colors.grey[500],
                size: 22,
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[50],
                    offset: Offset(1, 3),
                    blurRadius: 4),
              ],
            ),
            child: ListTile(
              onTap: () {},
              leading: Icon(
                Icons.notifications_outlined,
                size: 26,
                color: Colors.red[500],
              ),
              title: CustomText(
                text: "Notifications",
                color: Colors.grey[500],
                size: 22,
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[50],
                    offset: Offset(1, 3),
                    blurRadius: 4),
              ],
            ),
            child: ListTile(
              onTap: () async {
                authProvider.signOut();
                authProvider.cleanContorollers();
                changeScreen(context, LoginScreen());
              },
              leading: Icon(
                Icons.bookmark_border,
                size: 22,
                color: Colors.red[500],
              ),
              title: CustomText(
                text: "Mes commandes",
                color: Colors.grey[500],
                size: 22,
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[50],
                    offset: Offset(1, 3),
                    blurRadius: 4),
              ],
            ),
            child: ListTile(
              onTap: () async {
                authProvider.signOut();
                authProvider.cleanContorollers();
                changeScreen(context, LoginScreen());
              },
              leading: Icon(
                Icons.logout,
                size: 22,
                color: Colors.red[500],
              ),
              title: CustomText(
                text: "Déconnexion",
                color: Colors.grey[500],
                size: 22,
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
