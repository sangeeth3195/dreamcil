import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyOrdersView extends StatefulWidget {
  MyOrdersView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new HomeWidgetState();
  }
}

class HomeWidgetState extends State<MyOrdersView>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    new Tab(text: "Processing"),
    new Tab(text: "Delivered"),
    new Tab(text: "Cancelled")
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Text('My Orders'),
        elevation: 0,
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_backspace,
            color: Colors.white,
          ),
        ),
        bottom: new TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: new BubbleTabIndicator(
            indicatorHeight: 35.0,
            indicatorColor: Colors.green,
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
          ),
          tabs: tabs,
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: tabs.map((Tab tab) {
          return Container(
              padding: EdgeInsets.all(4),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: _theme.primaryColor.withOpacity(0.3),
                      blurRadius: 8,
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: 'Order: ',
                              style: _theme.textTheme.display1.copyWith(
                                  color: _theme.primaryColorLight,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: '#' + '19478935',
                              style: _theme.textTheme.display1
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ])),
                          Text(
                            '1995-12-12',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Tacking Number: ',
                                style: _theme.textTheme.display1
                                    .copyWith(color: _theme.primaryColorLight),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'IwE78946252245',
                                  style: _theme.textTheme.display1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Quantity: ',
                                    style: _theme.textTheme.display1.copyWith(
                                        color: _theme.primaryColorLight),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Text(
                                      '250',
                                      style: _theme.textTheme.display1,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Totat Amount: ',
                                    style: _theme.textTheme.display1.copyWith(
                                        color: _theme.primaryColorLight),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      '\$' + '456',
                                      //total amount
                                      style: _theme.textTheme.display1,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RaisedButton(
                            padding: EdgeInsets.only(
                                left: 24, right: 24, top: 10, bottom: 10),
                            color: AppColors.white,
                            onPressed: () {
                              Fluttertoast.showToast(msg: 'Click');

                              /*onClick(order.id);*/
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                    color: AppColors.black, width: 2)),
                            child: Text(
                              'Details',
                              style: _theme.textTheme.display1,
                            ),
                          ),
                          Text('Delivered'),
                        ],
                      )
                    ],
                  ),
                ),
              ));

          /*Container(
              padding: EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'Order: ',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.green),
                              ),
                              TextSpan(
                                text:
                                '#' + '1052558245582',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.green),
                              ),
                            ])),
                        Text(
                          '1995-12-12',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'Tacking Number: ',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.green),
                                ),
                                TextSpan(
                                  text: 'trackingNumber',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.green),
                                ),
                              ])),
                          Text('Delivered',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.green)),
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'orderData.',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.green),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4),
                              child: Text(
                                'items',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.green),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    Row(children: <Widget>[

                      RaisedButton(
                        child: Text('Reorder'),
                        onPressed: (() => {
                          //TODO: reorder process
                        }),
                        color: Colors.green,
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 15),
                      ),

                      RaisedButton(
                        child: Text('Leave Feedback'),
                        onPressed: (() => {
                          //TODO: leave feedback
                        }),
                        color: Colors.red,
                      ),

                    ])
                  ],
                ),
              ));*/

        }).toList(),
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
