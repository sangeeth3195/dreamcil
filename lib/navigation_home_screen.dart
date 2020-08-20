
import 'package:dreamcil/addcart.dart';
import 'package:dreamcil/broucher.dart';
import 'package:dreamcil/dashboard.dart';
import 'package:dreamcil/notification.dart';
import 'package:dreamcil/profile.dart';
import 'package:dreamcil/utils/app_theme.dart';
import 'package:dreamcil/videos.dart';
import 'package:dreamcil/wishlist.dart';
import 'package:flutter/material.dart';

import 'custom_drawer/drawer_user_controller.dart';
import 'custom_drawer/home_drawer.dart';
import 'dealership.dart';
import 'feedback_screen.dart';
import 'gallery.dart';
import 'help_screen.dart';
import 'invite_friend_screen.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const Dashboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = const Dashboard();
        });
      } else if (drawerIndex == DrawerIndex.Gallery) {
        setState(() {
          screenView = Gallery();
        });
      }else if (drawerIndex == DrawerIndex.Videos) {
        setState(() {
          screenView = Videos();
        });
      } else if (drawerIndex == DrawerIndex.Dealership) {
        setState(() {
          screenView = Dealership();
        });
      }else if (drawerIndex == DrawerIndex.Broucher) {
        setState(() {
          screenView = Broucher();
        });
      }  else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = InviteFriend();
        });
      }else if (drawerIndex == DrawerIndex.Share) {
        setState(() {
          screenView = Profile();
        });
      }else if (drawerIndex == DrawerIndex.Profile) {
        setState(() {
          screenView = Profile();
        });
      }else if (drawerIndex == DrawerIndex.Wishlist) {
        setState(() {
          screenView = WishList();
        });
      }else if (drawerIndex == DrawerIndex.Notifications) {
        setState(() {
          screenView = NotificationScreen();
        });
      }else if (drawerIndex == DrawerIndex.Cart) {
        setState(() {
          screenView = CartScreen();
        });
      }else if (drawerIndex == DrawerIndex.About) {
        setState(() {
          screenView = Profile();
        });
      } else {
        //do in your way......
      }
    }
  }
}