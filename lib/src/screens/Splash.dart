import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/widgets/custom_text.dart';
import 'package:flutter_application_1/src/widgets/loading.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText(
                text: "Loading",
                size: 22,
                color: Colors.grey[400],
              ),
              SizedBox(
                height: 50,
              ),
              Loading(),
            ],
          ),
        ));
  }
}
