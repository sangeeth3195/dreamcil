import 'dart:async';
import 'dart:core';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamcil/ui/addcart.dart';
import 'package:dreamcil/ui/details.dart';
import 'package:dreamcil/ui/profile.dart';
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
          body: Stack(
            children: <Widget>[body(context), header(), footer()],
          ),
        ),
      ),
    );
  }

  Widget body(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '       Dreamcil',
          style: TextStyle(
            color: Colors.green,
            fontSize: 18,
            letterSpacing: .8,
            fontStyle: FontStyle.normal,
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
              Navigator.of(context).push(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {
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
              Navigator.of(context).push(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {
                return NotificationScreen();
              }));
            },
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return Profile();
                  }));
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F1.jpg?alt=media'),
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 50,
          left: 0,
          right: 0,
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
        ),
      ],
    );
  }

  Widget footer() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 200,
          left: 0,
          right: 0,
          child: new StreamBuilder(
            stream:
                Firestore.instance.collection('products').limit(20).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.pink)));
              } else {
                return getExpenseItems(snapshot);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: snapshot.data.documents.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
      ),
      itemBuilder: (contxt, indx) {
        return Card(
          margin: EdgeInsets.all(4.0),
          color: Colors.purpleAccent,
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(
                          name: snapshot.data.documents[indx].data['name'],
                        picture: snapshot.data.documents[indx].data['pic'],price:
                      snapshot.data.documents[indx].data['Price'],),
                    ),
                  );
                },
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image.network(
                    snapshot.data.documents[indx].data['pic'].toString(),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                  child: Positioned(
                      bottom: 10.0,
                      child: Column(
                        children: <Widget>[
                          Center(
                              child: Text(
                            snapshot.data.documents[indx].data['name']
                                .toString(),
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )),
                          Center(
                              child: Text(
                            "₹ " +
                                snapshot.data.documents[indx].data['Price']
                                    .toString(),
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )),
                        ],
                      )))
            ],
          ),
        );
      },
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
