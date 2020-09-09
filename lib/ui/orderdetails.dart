import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new HomeWidgetState();
  }
}

class HomeWidgetState extends State<OrderDetails>
    with SingleTickerProviderStateMixin {
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
    var _theme = Theme.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
          ' Orders Details',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // SizedBox(height: 20,),
            Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: 'Order: ',
                        style: _theme.textTheme.display1.copyWith(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: '#' + '19478935',
                        style: _theme.textTheme.display1.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ])),
                    Text(
                      '1995-12-12',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    )
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text(
                    'Tacking Number: ',
                    style: _theme.textTheme.display1.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'IwE78946252245',
                      style: _theme.textTheme.display1.copyWith(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Items',
                  style: _theme.textTheme.display1.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 3,
              itemExtent: 100,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.lightGray,
                            blurRadius: 8,
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.backgroundLight,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children:<Widget> [
                            Expanded(
                              child: Container(
                                width: 100,
                                child: Image.asset(
                                  'assets/images/userImage.png'
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        'Name',
                                        style: _theme.textTheme.display1.copyWith(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                        ),

                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        'units',
                                        style: _theme.textTheme.display1.copyWith(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        'RS.7000',
                                        style: _theme.textTheme.display1.copyWith(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            )
                          ],
                        ),

                      ),
                    ));

                return new Row(
                  children: <Widget>[
                    Icon(Icons.access_alarm),
                    Text(' Entry $index'),
                  ],
                );
              },
            )),


            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Order Summary',
                  style: _theme.textTheme.display1.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: <Widget>[
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Shipping Address:',
                        style: _theme.textTheme.display1.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        'COimbatore ',
                        style: _theme.textTheme.display1.copyWith(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
            ]),
            SizedBox(
              height: 20,
            ),

            Row(children: <Widget>[
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Payment Method:',
                        style: _theme.textTheme.display1.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        'COD ',
                        style: _theme.textTheme.display1.copyWith(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
            ]),
            SizedBox(
              height: 20,
            ),

            Row(children: <Widget>[
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Delivery Method:',
                        style: _theme.textTheme.display1.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        'Courier ',
                        style: _theme.textTheme.display1.copyWith(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
            ]),
            SizedBox(
              height: 20,
            ),

            Row(children: <Widget>[
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Discount:',
                        style: _theme.textTheme.display1.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        '200 ',
                        style: _theme.textTheme.display1.copyWith(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
            ]),
            SizedBox(
              height: 20,
            ),

            Row(children: <Widget>[
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Total  Amount:',
                        style: _theme.textTheme.display1.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        '20000.00 ',
                        style: _theme.textTheme.display1.copyWith(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
            ]),
            SizedBox(
              height: 20,
            ),

            Row(children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: RaisedButton(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    color: AppColors.white,
                    onPressed: () {
                      Fluttertoast.showToast(msg: 'Click');

                      /*onClick(order.id);*/
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.black, width: 2)),
                    child: Text(
                      'Reorder',
                      style: _theme.textTheme.display1.copyWith(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: RaisedButton(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    color: AppColors.red,
                    onPressed: () {
                      Fluttertoast.showToast(msg: 'Click');

                      /*onClick(order.id);*/
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.transparent, width: 2)),
                    child: Text(
                      'Leave Feedback',
                      style: _theme.textTheme.display1.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class AppColors {
  static const red = Color(0xFFDB3022);
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const white = Color(0xFFFFFFFF);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
}
