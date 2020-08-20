import 'dart:async';
import 'dart:core';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:dreamcil/addcart.dart';
import 'package:dreamcil/profile.dart';
import 'package:dreamcil/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login.dart';
import 'notification.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardHome(),
      routes: <String, WidgetBuilder>{
        '/dashboard': (BuildContext context) => Dashboard(),
        '/login': (BuildContext context) => LoginPage(),
      },
    );
  }
}

class DashboardHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }
}

Widget _imgCarousel() {
  return Container(
    height: 150,
    child: Carousel(
      overlayShadow: true,
      overlayShadowColors: Colors.black38,
      dotSize: 4.0,
      autoplay: true,
      animationCurve: Curves.bounceInOut,
      dotBgColor: Colors.transparent,
      boxFit: BoxFit.cover,
      images: [
        AssetImage('assets/banner/banner.jpg'),
        AssetImage('assets/banner/banner1.png'),
        AssetImage('assets/banner/banner2.jpg'),
        AssetImage('assets/banner/banner.jpg'),
        AssetImage('assets/banner/banner1.png'),
        AssetImage('assets/banner/banner2.jpg'),
      ],
    ),
  );
}

class HomePage extends State<DashboardHome> {
  Widget tabBody = Container(
    color: AppTheme.background,
  );

  DateTime currentBackPressTime;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: SafeArea(
        child: Scaffold(
          body: Builder(builder: (BuildContext context) {
            return Stack(
              children: <Widget>[
                Scaffold(
                  appBar: AppBar(
                    title: Text(
                      '      Dreamcil',
                      style: TextStyle(
                        color: Colors.green,
                        letterSpacing: .8,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                            return CartScreen();
                          }));
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                            return NotificationScreen();
                          }));
                        },
                      ),
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                                return Profile();
                              }));
                            },
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage('https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F1.jpg?alt=media'),
                              backgroundColor: Colors.grey[300],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  body: _imgCarousel(),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    var now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Please click BACK again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }
}
