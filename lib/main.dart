import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/providers/Product.dart';
import 'package:flutter_application_1/src/providers/appProvider.dart';
import 'package:flutter_application_1/src/providers/categorie.dart';
import 'package:flutter_application_1/src/providers/userProvider.dart';
import 'package:flutter_application_1/src/screens/Splash.dart';
import 'package:flutter_application_1/src/screens/home.dart';
import 'package:flutter_application_1/src/screens/login.dart';
import 'package:flutter_application_1/src/screens/register.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: CategorieProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
        ChangeNotifierProvider.value(value: AppProvider.initialize()),
      ],
      child: MaterialApp(
        title: 'Food App ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red[600],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ScreensController(),
      ),
    ),
  );
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitilaized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default:
        return LoginScreen();
    }
  }
}
