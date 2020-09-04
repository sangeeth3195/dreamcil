import 'package:dreamcil/utils/string.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Signin/ui/widgets/loading.dart';
import 'Signin/util/auth.dart';
import 'Signin/util/state_widget.dart';
import 'Signin/util/validator.dart';
import 'Widgets/CustomIcons.dart';
import 'Widgets/SocialIcons.dart';
import 'dashboard.dart';
import 'navigation_home_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => new _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _isSelected = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  bool _autoValidate = false;
  bool _loadingVisible = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async {
    try {
      setState(() {
        _loadingVisible = true;
      });

      await _googleSignIn.signIn();

      var newuser = await Auth.checkUserExist(_googleSignIn.currentUser.id);
      if (newuser == false) {
       await Navigator.pushNamed(context, '/signup');
      } else {
        await Navigator.pushNamed(context, '/');
      }

      setState(() {
        _loadingVisible = false;
      });
    } catch (err) {
      setState(() {
        _loadingVisible = false;
      });

      print(err);
    }
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  Future<void> _changeLoadingVisible() async {
    setState(() {
      _loadingVisible = !_loadingVisible;
    });
  }

  void _emailLogin(
      {String email, String password, BuildContext context}) async {
    try {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      await _changeLoadingVisible();
      //need await so it has chance to go through error if found.
      await StateWidget.of(context).logInUser(email, password);
      await Navigator.pushNamed(context, '/');
    } catch (e) {
      _changeLoadingVisible();
      print("Sign In Error: $e");
      String exception = Auth.getExceptionText(e);
      Flushbar(
        title: "Sign In Error",
        message: exception,
        duration: Duration(seconds: 5),
      )..show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
        key: _formKey,
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: LoadingScreen(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Image.asset("assets/image_01.png"),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(child: Image.asset("assets/image_02.png"))
                  ],
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/logo.png",
                              width: ScreenUtil.getInstance().setWidth(110),
                              height: ScreenUtil.getInstance().setHeight(110),
                            ),
                            Text("LOGO",
                                style: TextStyle(
                                    fontFamily: "Poppins-Bold",
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(46),
                                    letterSpacing: .6,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(180),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(bottom: 1),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, 15.0),
                                    blurRadius: 15.0),
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, -10.0),
                                    blurRadius: 10.0),
                              ]),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Login",
                                    style: TextStyle(
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(45),
                                        fontFamily: "Poppins-Bold",
                                        letterSpacing: .6)),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(30),
                                ),
                                Text("Username",
                                    style: TextStyle(
                                        fontFamily: "Poppins-Medium",
                                        fontSize: ScreenUtil.getInstance()
                                            .setSp(26))),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  controller: _email,
                                  validator: Validator.validateEmail,
                                  decoration: InputDecoration(
                                      hintText: "username",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 12.0)),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(30),
                                ),
                                Text("PassWord",
                                    style: TextStyle(
                                        fontFamily: "Poppins-Medium",
                                        fontSize: ScreenUtil.getInstance()
                                            .setSp(26))),
                                TextFormField(
                                  autofocus: false,
                                  obscureText: true,
                                  controller: _password,
                                  validator: Validator.validatePassword,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 12.0)),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(35),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontFamily: "Poppins-Medium",
                                          fontSize: ScreenUtil.getInstance()
                                              .setSp(28)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                            height: ScreenUtil.getInstance().setHeight(40)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 12.0,
                                ),
                                GestureDetector(
                                  onTap: _radio,
                                  child: radioButton(_isSelected),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text("Remember me",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Poppins-Medium"))
                              ],
                            ),
                            InkWell(
                              child: Container(
                                width: ScreenUtil.getInstance().setWidth(330),
                                height: ScreenUtil.getInstance().setHeight(100),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF17ead9),
                                      Color(0xFF6078ea)
                                    ]),
                                    borderRadius: BorderRadius.circular(6.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color(0xFF6078ea).withOpacity(.3),
                                          offset: Offset(0.0, 8.0),
                                          blurRadius: 8.0)
                                    ]),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      _emailLogin(
                                          email: _email.text,
                                          password: _password.text,
                                          context: context);
                                    },
                                    child: Center(
                                      child: Text("SIGNIN",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins-Bold",
                                              fontSize: 18,
                                              letterSpacing: 1.0)),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            horizontalLine(),
                            Text("Social Login",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: "Poppins-Medium")),
                            horizontalLine()
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SocialIcon(
                              colors: [
                                Color(0xFF102397),
                                Color(0xFF187adf),
                                Color(0xFF00eaf8),
                              ],
                              iconData: CustomIcons.facebook,
                              onPressed: () {
                                /*   Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavigationHomeScreen(),
                            ),
                          );*/
                              },
                            ),
                            SocialIcon(
                              colors: [
                                Color(0xFFff4f38),
                                Color(0xFFff355d),
                              ],
                              iconData: CustomIcons.googlePlus,
                              onPressed: () {
                                _login();
                              },
                            ),
                            SocialIcon(
                              colors: [
                                Color(0xFF17ead9),
                                Color(0xFF6078ea),
                              ],
                              iconData: CustomIcons.twitter,
                              onPressed: () {
                                /*Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavigationHomeScreen(),
                            ),
                          );*/
                              },
                            ),
                            SocialIcon(
                              colors: [
                                Color(0xFF00c6fb),
                                Color(0xFF005bea),
                              ],
                              iconData: CustomIcons.linkedin,
                              onPressed: () {
                                /*Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavigationHomeScreen(),
                            ),
                          );*/
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "New User? ",
                              style: TextStyle(fontFamily: "Poppins-Medium"),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text("SignUp",
                                  style: TextStyle(
                                      color: Color(0xFF5d74e3),
                                      fontFamily: "Poppins-Bold")),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            inAsyncCall: _loadingVisible));
  }
}

class FormCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Login",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("Username",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              decoration: InputDecoration(
                  hintText: "username",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("PassWord",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(28)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
