import 'package:dreamcil/Signin/ui/theme.dart';
import 'package:dreamcil/ui/cart.dart';
import 'package:dreamcil/ui/dashboard.dart';
import 'package:dreamcil/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:dreamcil/Signin/util/state_widget.dart';
import 'package:dreamcil/Signin/ui/screens/sign_up.dart';
import 'package:dreamcil/Signin/ui/screens/forgot_password.dart';

import 'ProductAdd.dart';

class MyApp extends StatelessWidget {
  MyApp() {
    //Navigation.initPaths();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp Title',
      theme: buildTheme(),
      //onGenerateRoute: Navigation.router.generator,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginPage(),
        '/signin': (context) => LoginPage(),
        '/signup': (context) => SignUpScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/dashboard': (context) => Dashboard(),
        '/addproduct': (context) => OrderPage(),
        '/OrderPage': (context) => OrderPage(),
      },
    );
  }
}

void main() {
  StateWidget stateWidget = new StateWidget(
    child: new MyApp(),
  );
  runApp(stateWidget);
}
