import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class GridHeader extends StatefulWidget {
  @override
  _GridHeaderState createState() => _GridHeaderState();
}

class _GridHeaderState extends State<GridHeader> {
  List<String> listHeader = [
    'HEADER1',
    'HEADER2',
    'HEADER3',
    'HEADER4',
    'HEADER5',
    'HEADER6',
    'HEADER7',
    'HEADER8',
    'HEADER9',
    'HEADER10',
  ];
  List<String> listTitle = [
    'title1',
    'title2',
    'title3',
    'title4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid Header Demo"),
      ),
      body: gridHeader1(),
    );
  }

  Widget gridHeader() {
    return new ListView.builder(
      itemCount: listHeader.length,
      itemBuilder: (context, index) {
        return new StickyHeader(
          header: new Container(
            height: 38.0,
            color: Colors.white,
            padding: new EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.centerLeft,
            child: new Text(
              listHeader[index],
              style: const TextStyle(
                  color: Colors.purple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          content: Container(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: listTitle.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemBuilder: (contxt, indx) {
                return Card(
                  margin: EdgeInsets.all(4.0),
                  color: Colors.purpleAccent,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, top: 6.0, bottom: 2.0),
                    child: Center(
                        child: Text(
                      listTitle[indx],
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    )),
                  ),
                );
              },
            ),
          ),
        );
      },
      shrinkWrap: true,
    );
  }

  Widget gridHeader1() {
    return new StreamBuilder(
      stream: Firestore.instance.collection('products').limit(20).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.pink)));
        } else {
          return getExpenseItems(snapshot);
        }
      },
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
              Container(
                height: 200,
                width: 200,
                child: Image.network(
                  snapshot.data.documents[indx].data['pic'].toString(),
                  fit: BoxFit.fill,
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
}
