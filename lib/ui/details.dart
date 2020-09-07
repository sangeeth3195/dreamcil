import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../fakedata/global.dart';

class Details extends StatefulWidget {
  Details(
      {Key key, @required this.name, @required this.picture, @required this.price})
      : super(key: key);

  final String name;
  final String picture;
  final String price;

  @override
  _DetailsState createState() =>
      _DetailsState(name: name, picture: picture, price: price);
}

int indicatorActive = 0;

class _DetailsState extends State<Details> {

  _DetailsState(
      {Key key, @required this.name, @required this.picture, @required this.price});

  final String name;
  final String picture;
  final String price;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: productColors[1],
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 25),
                color: productColors[1],
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Expanded(
                          child: PageView.builder(
                            controller: PageController(
                              initialPage: 0,
                              keepPage: true,
                            ),
                            itemCount: products.length,
                            onPageChanged: (pageId) {
                              setState(() {
                                indicatorActive = pageId;
                              });
                              print(pageId);
                            },
                            itemBuilder: (ctx, id) {
                              return Image.network(
                                picture,
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 11),
                        Container(
                          height: 11,
                          child: PageIndicators(
                            itemCount: 4,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Spacer(),
                          /* IconButton(
                            icon: Icon(Icons.tune),
                            onPressed: () {},
                          ),*/
                          IconButton(
                            icon: Icon(Icons.shopping_cart),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  color: darkBg,
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding:
                        EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white24,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(name.toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17)),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text("₹ " + price.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Fluttertoast.showToast(msg: 'onclick');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(15.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: green,
                                      boxShadow: [
                                        BoxShadow(
                                            color: green,
                                            offset: Offset(0, 3),
                                            blurRadius: 5.0)
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 9.0,
                            ),
                            Row(
                              children: List<Widget>.generate(
                                4,
                                    (f) {
                                  return Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(5.0),
                                      padding: EdgeInsets.all(9.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white12,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          icons[f],
                                          Text(
                                            productSpecifications[f]["value"],
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            productSpecifications[f]["type"],
                                            style: TextStyle(
                                              // fontSize: 17,
                                              color: Colors.white54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Expanded(
                              child: Text(
                                "Lorem ipsum dolor sit amet consectetur adipisicing elit. A saepe velit soluta molestiae tempore accusamus voluptates repudiandae explicabo voluptas vitae non illo rerum aperiam earum et ullam, enim laudantium facere!",
                                style: TextStyle(
                                    color: Colors.white54, height: 1.2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "Other Products",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Colors.white,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.clip,
                              ),
                              SizedBox(
                                height: 9.0,
                              ),
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        products[0]["pictureLink"]),
                                    backgroundColor: productColors[0],
                                  ),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        products[1]["pictureLink"]),
                                    backgroundColor: productColors[1],
                                  ),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        products[2]["pictureLink"]),
                                    backgroundColor: productColors[2],
                                  ),
                                ],
                              ),
                              SizedBox(height: 15,)
                            ],
                          ),
                          Spacer(),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(45),
                                  ),
                                ),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageIndicators extends StatelessWidget {
  final int itemCount;

  const PageIndicators({Key key, this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (ctx, id) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          height: 9,
          width: 9,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: indicatorActive == id ? accent : Color(0xffe6c6b2),
          ),
        );
      },
    );
  }
}
