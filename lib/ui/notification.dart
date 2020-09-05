
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyNotificationListScreen();
  }
}

class EmptyNotificationListScreen extends StatefulWidget {
  @override
  _EmptyNotificationListScreenState createState() =>
      _EmptyNotificationListScreenState();
}

class _EmptyNotificationListScreenState extends State<EmptyNotificationListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(builder: (BuildContext context) {
          return Stack(
            children: <Widget>[
              Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Notification',
                    style: TextStyle(
                      color: Colors.green,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                body: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 70,
                      child: Container(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 250,
                      child: Image.asset(
                        "assets/images/empty_notification.png",
                        height: 180,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Empty Notification",
                        style: TextStyle(
                          color: Color(0xFF67778E),
                          fontFamily: 'Roboto-Light.ttf',
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
      /*child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70,
              child: Container(
                color: Color(0xFFFFFFFF),
              ),
            ),
            Container(
              width: double.infinity,
              height: 250,
              child: Image.asset(
                "assets/images/empty_wishlist.png",
                height: 250,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 40,
              child: Container(
                color: Color(0xFFFFFFFF),
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                "You haven't anything to wish List",
                style: TextStyle(
                  color: Color(0xFF67778E),
                  fontFamily: 'Roboto-Light.ttf',
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),*/
    );
  }
}
