import 'package:dreamcil/fakedata/ScopeManage.dart';
import "package:scoped_model/scoped_model.dart";
import "package:flutter/material.dart";
import 'package:flutter_rating/flutter_rating.dart';

import 'onboardingscreen.dart';

class Home extends StatefulWidget {
  AppModel appModel;
  static final String route = "Home-route";

  Home({this.appModel});

  @override
  State<StatefulWidget> createState() {

    return HomeState();
  }
}

class HomeState extends State<Home> {
  Widget GridGenerate(List<Data> data, aspectRadtio) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: aspectRadtio),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnboardingScreen()) //detail: data[index]
                      );
                },
                child: Container(
                    height: 350.0,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 8.0)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: Image.network(
                                      data[index].image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: data[index].fav
                                      ? Icon(
                                          Icons.favorite,
                                          size: 20.0,
                                          color: Colors.red,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          size: 20.0,
                                        ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "${data[index].name}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new StarRating(
                                  size: 15.0,
                                  rating: data[index].rating,
                                  color: Colors.orange,
                                  borderColor: Colors.grey,
                                  starCount: 5),
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  "\$${data[index].price.toString()}",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ));
        },
        itemCount: data.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        elevation: 0.0,
        actions: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: InkResponse(
                  onTap: () {
                    /* Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));*/
                  },
                  child: Icon(Icons.shopping_cart),
                ),
              ),
            ],
          )
        ],
      ),
      body: ScopedModelDescendant<AppModel>(builder: (context, child, model) {
        return GridGenerate(model.itemListing, (itemWidth / itemHeight));
      }),
    );
  }
}
