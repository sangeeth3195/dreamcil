import 'package:dreamcil/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<Gallery> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '      Gallery',
              style: TextStyle(
                color: Colors.green,
                letterSpacing: .8,
                fontStyle: FontStyle.italic,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: AppTheme.nearlyWhite,
          body: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: Colors.white,
              ),
              child: StaggeredGridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                staggeredTiles: [
                  StaggeredTile.count(4, 2),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(4, 1),

                  StaggeredTile.count(4, 2),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(4, 1),

                  StaggeredTile.count(4, 2),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(1, 1),
                  StaggeredTile.count(4, 1),
                ],
                children: <Widget>[
                  myPhotoList(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRM9OIi8hfQRACVx9a0acIcTLkHeuN7ViTqow&usqp=CAU"),
                  myPhotoList(
                      "https://i0.wp.com/www.dreamcil.com/wp-content/uploads/2020/06/2-Side-Tip.jpg?resize=370%2C370&ssl=1"),
                  myPhotoList(
                      "https://i0.wp.com/www.dreamcil.com/wp-content/uploads/2020/06/4.jpg?resize=370%2C370&ssl=1"),
                  myPhotoList(
                      "https://i0.wp.com/www.dreamcil.com/wp-content/uploads/2020/06/2-tip.jpg?resize=370%2C370&ssl=1"),
                  myPhotoList(
                      "https://i2.wp.com/www.dreamcil.com/wp-content/uploads/2020/06/2.jpg?resize=370%2C370&ssl=1"),
                  captionText("Norway", "Just now"),

                  myPhotoList(
                      "https://i0.wp.com/www.dreamcil.com/wp-content/uploads/2020/06/2-tip.jpg?fit=1833%2C1833&ssl=1"),
                  myPhotoList(
                      "https://i2.wp.com/www.dreamcil.com/wp-content/uploads/2020/06/tip.jpg?resize=370%2C370&ssl=1"),
                  myPhotoList(
                      "https://i1.wp.com/www.dreamcil.com/wp-content/uploads/2020/06/hand.jpg?fit=200%2C200&ssl=1"),
                  myPhotoList(
                      "https://i2.wp.com/www.dreamcil.com/wp-content/uploads/2020/06/3.jpg?fit=200%2C200&ssl=1"),
                  myPhotoList(
                      "https://i2.wp.com/www.dreamcil.com/wp-content/uploads/2020/06/close.jpg?fit=200%2C200&ssl=1"),
                  captionText("Mountains", "2 day ago"),

                  myPhotoList(
                      "https://i2.wp.com/www.dreamcil.com/wp-content/uploads/2020/06/About-Us-168x168-1.jpg?fit=168%2C168&ssl=1"),
                  myPhotoList(
                      "https://i2.wp.com/www.dreamcil.com/wp-content/uploads/2020/06/Home_About.jpg?fit=556%2C356&ssl=1"),
                  myPhotoList(
                      "https://i2.wp.com/www.dreamcil.com/wp-content/uploads/2020/06/1-Front.jpg?fit=1833%2C1833&ssl=1"),
                  myPhotoList(
                      "https://i1.wp.com/www.dreamcil.com/wp-content/uploads/2020/06/4-1.jpg?fit=1833%2C1833&ssl=1"),
                  myPhotoList(
                      "https://i2.wp.com/www.dreamcil.com/wp-content/uploads/2020/06/1.jpg?fit=1833%2C1833&ssl=1"),
                  captionText("Mountains", "2 day ago"),

                ],
                padding: const EdgeInsets.all(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget myPhotoList(String MyImages) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(MyImages),
        ),
      ),
    );
  }

  Widget captionText(String titleText, String subText) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  titleText,
                  style: TextStyle(color: Colors.black, fontSize: 24.0),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  subText,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
