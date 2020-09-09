import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key,
    @required this.prod_name,
    @required this.prod_pic,
    @required this.prod_quantity,
    @required this.prod_price})
      : super(key: key);

  final String prod_name;
  final String prod_pic;
  final String prod_quantity;
  final String prod_price;

  @override
  _OrderState createState() =>
      _OrderState(prodName: prod_name, prodPic: prod_pic,
          prodQuantity: prod_quantity, prodPrice: prod_price);

}

class _OrderState extends State<OrderPage> {
  _OrderState({Key key,
    @required this.prodName,
    @required this.prodPic,
    @required this.prodQuantity,
    @required this.prodPrice});

  final String prodName;
  final String prodPic;
  final String prodQuantity;
  final String prodPrice;

  bool _loadingVisible = false;
  final firestoreInstance = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Order Summary",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemBuilder: (context, index) {
                  //     return Column(
                  //       children: <Widget>[
                  //         Row(
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: <Widget>[
                  //             Container(
                  //               height: 24,
                  //               width: 24,
                  //               decoration: BoxDecoration(
                  //                   border:
                  //                   Border.all(color: Colors.grey.shade300),
                  //                   borderRadius: BorderRadius.circular(5)),
                  //               child: Center(
                  //                 child: Text(
                  //                   prodPrice.toString(),
                  //                   style: TextStyle(
                  //                       fontWeight: FontWeight.bold,
                  //                       fontSize: 12),
                  //                 ),
                  //               ),
                  //             ),
                  //             SizedBox(
                  //               width: 8,
                  //             ),
                  //             Text("*"),
                  //             SizedBox(
                  //               width: 8,
                  //             ),
                  //             Expanded(
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: <Widget>[
                  //                   Text(
                  //                     prodName.toString(),
                  //                     style: TextStyle(
                  //                         fontWeight: FontWeight.w600),
                  //                   ),
                  //                   /*SizedBox(
                  //                     height: 8,
                  //                   ),
                  //                   Text(
                  //                     orderItems[index].secondaryText,
                  //                     style: TextStyle(
                  //                         fontSize: 12,
                  //                         color: Colors.grey.shade500),
                  //                   ),*/
                  //                 ],
                  //               ),
                  //             ),
                  //             Text(
                  //               prodPrice.toString(),
                  //               style: TextStyle(
                  //                   color: Colors.green,
                  //                   fontSize: 17,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //           ],
                  //         ),
                  //         SizedBox(
                  //           height: 14,
                  //         ),
                  //         Divider(
                  //           thickness: 1.3,
                  //           color: Colors.grey.shade200,
                  //           height: 1,
                  //         ),
                  //         SizedBox(
                  //           height: 14,
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Order",
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade500),
                      ),
                      Text(
                        "\$69.60",
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  Text(
                    "Address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "725 5th Ave,\nNY 10024 New York",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                            height: 1.4),
                      ),
                      Text(
                        "Change",
                        style: TextStyle(fontSize: 14, color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Payment",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(
                        "images/mastercard.png",
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "**** **** **** ",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                            height: 1.4),
                      ),
                      Expanded(
                        child: Text(
                          "1420",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500),
                        ),
                      ),
                      Text(
                        "Change",
                        style: TextStyle(fontSize: 14, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 80,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "PLACE ORDER",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


