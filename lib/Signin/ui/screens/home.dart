import 'package:dreamcil/Signin/models/state.dart';
import 'package:dreamcil/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:dreamcil/Signin/util/state_widget.dart';
import 'package:dreamcil/Signin/ui/widgets/loading.dart';

import '../../../navigation_home_screen.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StateModel appState;
  bool _loadingVisible = false;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
     appState = StateWidget.of(context).state;
    if ((appState.user == null)) {
      return LoginPage();
    } else {
      return NavigationHomeScreen();

    }
  }
}
