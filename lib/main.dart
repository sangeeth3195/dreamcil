import 'package:dreamcil/Signin/ui/theme.dart';
import 'package:dreamcil/ui/Home.dart';
import 'package:dreamcil/ui/dashboard.dart';
import 'package:dreamcil/ui/grid.dart';
import 'package:dreamcil/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:dreamcil/Signin/util/state_widget.dart';
import 'package:dreamcil/Signin/ui/screens/sign_up.dart';
import 'package:dreamcil/Signin/ui/screens/forgot_password.dart';

import 'ProductAdd.dart';
import 'Signin/ui/screens/home.dart';
import 'navigation_home_screen.dart';

class MyApp extends StatelessWidget {
  MyApp() {
    //Navigation.initPaths();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp Title',
      theme: buildTheme(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => NavigationHomeScreen(),
        '/home': (context) => NavigationHomeScreen(),
        '/signin': (context) => LoginPage(),
        '/signup': (context) => SignUpScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
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
