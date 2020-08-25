import 'dart:async';
import 'dart:core';
import 'package:dreamcil/Home.dart';
import 'package:dreamcil/details.dart';
import 'package:dreamcil/fakedata/ScopeManage.dart';
import 'package:dreamcil/utils/permision.dart';
import 'package:dreamcil/utils/string.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scoped_model/scoped_model.dart';

import 'dashboard.dart';
import 'login.dart';

void main() {
  runApp(

    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/check': (BuildContext context) => LoginPage(),
        '/dashboard': (BuildContext context) => Dashboard()
      },
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AppModel appModel = AppModel();

  final routes = <String,WidgetBuilder>{
    Home.route:(BuildContext context)=>Home(),

  };
  var _visible = true;
  double screenWidth = 0.0;
  double screenheight = 0.0;
  AnimationController animationController;
  Animation<double> animation;

  void navigationPage() async {
    final dynamic storage = await PermissionFun().storagePermision();
//    if (storage.toString() == 'PermissionStatus.granted') {
    var bearer ='';
    if (bearer == null || bearer == '') {
      await Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: LoginPage(),
        ),
            (Route<dynamic> route) => false,
      );
    }
//    } else {
//      await Fluttertoast.showToast(msg: permission_warning);
//    }
  }

  @override
  void initState() {
    PushNotificationsManager().init();
    super.initState();

    setState(() {
      _visible = !_visible;
    });
//    navigationPage();
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
    screenWidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;
    return ScopedModel<AppModel>(
      model: appModel,
      child: MaterialApp(
        home: Home(appModel: appModel,),
        routes: routes,
        theme: ThemeData(
            primaryColor: Colors.white
        ),
      ),
    );
    return Scaffold(

    );
  }
}

class PushNotificationsManager {
  PushNotificationsManager._();
  factory PushNotificationsManager() => _instance;
  static final PushNotificationsManager _instance =
  PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: analytics);

  Future<void> init() async {
    if (!_initialized) {
      _firebaseMessaging.requestNotificationPermissions(
          const IosNotificationSettings(
              sound: true, badge: true, alert: true, provisional: true));
      _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {},
        onLaunch: (Map<String, dynamic> message) async {},
        onResume: (Map<String, dynamic> message) async {},
      );
      _initialized = true;
    }
  }
}
