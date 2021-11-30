import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/helpers/screen_navigation.dart';
import 'package:flutter_application_1/src/providers/userProvider.dart';
import 'package:flutter_application_1/src/screens/home.dart';
import 'package:flutter_application_1/src/screens/register.dart';
import 'package:flutter_application_1/src/widgets/custom_text.dart';
import 'package:flutter_application_1/src/widgets/loading.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _key,
      body: authProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 145,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.asset(
                        "images/fast.jpg",
                        width: 150,
                        height: 150,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Container(
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.red[600]),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: authProvider.email,
                              style: TextStyle(fontSize: 18),
                              cursorColor: Colors.red[600],
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  labelStyle: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.mail,
                                    color: Colors.red[600],
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Container(
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.red[600]),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: authProvider.password,
                              style: TextStyle(fontSize: 19),
                              obscureText: true,
                              cursorColor: Colors.red[600],
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.lock,
                                    color: Colors.red[600],
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 75,
                    ),
                    RaisedButton(
                      color: Colors.red[600],
                      textColor: Colors.white,
                      child: Container(
                        height: 60,
                        width: 100,
                        child: Center(
                          child: CustomText(
                            text: "Login",
                            color: Colors.white,
                            weight: FontWeight.bold,
                            size: 24,
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      onPressed: () async {
                        if (!await authProvider.signIn()) {
                          _key.currentState.showSnackBar(SnackBar(
                            content: CustomText(
                              text: "Authentification échouée!",
                              color: Colors.grey[400],
                            ),
                          ));
                          return;
                        }
                        authProvider.cleanContorollers();
                        changeScreen(context, Home());
                      },
                    ),
                    FlatButton(
                      onPressed: () {
                        changeScreen(context, Register());
                      },
                      child: CustomText(
                        text: "Vous n'avez pas un compte? Sign up",
                        color: Colors.grey[600],
                        weight: FontWeight.w500,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
