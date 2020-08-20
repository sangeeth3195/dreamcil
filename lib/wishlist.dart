import 'package:dreamcil/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return EmptyWishListScreen();
  }
}

class EmptyWishListScreen extends StatefulWidget {
  @override
  _EmptyWishListScreenState createState() =>
      _EmptyWishListScreenState();
}

class _EmptyWishListScreenState extends State<EmptyWishListScreen> {
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
                    '      WishList',
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
                        Fluttertoast.showToast(msg: 'Add Cart Clicked!');
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Fluttertoast.showToast(msg: 'Notificaton Clicked!');
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
