import 'package:documents_picker/documents_picker.dart';
import 'package:dreamcil/utils/app_theme.dart';
import 'package:dreamcil/utils/borders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Dealership extends StatefulWidget {
  @override
  _DealershipScreen4State createState() => _DealershipScreen4State();
}

class _DealershipScreen4State extends State<Dealership> {
  bool isSwitched = false;

  List<String> docPaths;

  void _getDocuments() async {
    docPaths = await DocumentsPicker.pickDocuments;

    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          child: Stack(
            children: <Widget>[
              ClipShadowPath(
                clipper: LoginDesign4ShapeClipper(),
                shadow: Shadow(blurRadius: 24, color: AppTheme.green),
                child: Container(
                  height: heightOfScreen * 0.4,
                  width: widthOfScreen,
                  color: AppTheme.green,
                  child: Container(
                    margin: EdgeInsets.only(left: Sizes.MARGIN_24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: heightOfScreen * 0.1,
                        ),
                        Text(
                          StringConst.WELCOME_BACK,
                          style: theme.textTheme.headline6.copyWith(
                            fontSize: Sizes.TEXT_SIZE_20,
                            color: AppTheme.white,
                          ),
                        ),
                        Text(
                          StringConst.Dealership,
                          style: theme.textTheme.headline4.copyWith(
                            color: AppTheme.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListView(
                padding: EdgeInsets.all(Sizes.PADDING_0),
                children: <Widget>[
                  SizedBox(
                    height: heightOfScreen * 0.25,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: Sizes.MARGIN_20),
                    child: _buildForm(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    ThemeData theme = Theme.of(context);
    return Column(
      children: <Widget>[
        CustomTextFormField(
          textInputType: TextInputType.text,
          labelText: StringConst.NAME,
          border: Borders.customOutlineInputBorder(),
          enabledBorder: Borders.customOutlineInputBorder(),
          focusedBorder: Borders.customOutlineInputBorder(
            color: AppTheme.violetShade200,
          ),
          labelStyle: Styles.customTextStyle(),
          hintTextStyle: Styles.customTextStyle(),
          textStyle: Styles.customTextStyle(),
        ),
        SpaceH20(),
        CustomTextFormField(
          textInputType: TextInputType.text,
          labelText: StringConst.EMAIL_ADDRESS,
          border: Borders.customOutlineInputBorder(),
          enabledBorder: Borders.customOutlineInputBorder(),
          focusedBorder: Borders.customOutlineInputBorder(
            color: AppTheme.violetShade200,
          ),
          labelStyle: Styles.customTextStyle(),
          hintTextStyle: Styles.customTextStyle(),
          textStyle: Styles.customTextStyle(),
        ),
        SpaceH12(),
        CustomTextFormField(
          textInputType: TextInputType.phone,
          labelText: StringConst.MOBILE,
          border: Borders.customOutlineInputBorder(),
          enabledBorder: Borders.customOutlineInputBorder(),
          focusedBorder: Borders.customOutlineInputBorder(
            color: AppTheme.violetShade200,
          ),
          labelStyle: Styles.customTextStyle(),
          hintTextStyle: Styles.customTextStyle(),
          textStyle: Styles.customTextStyle(),
        ),
        SpaceH20(),
        CustomTextFormField(
          textInputType: TextInputType.text,
          labelText: StringConst.ADDRESS,
          border: Borders.customOutlineInputBorder(),
          enabledBorder: Borders.customOutlineInputBorder(),
          focusedBorder: Borders.customOutlineInputBorder(
            color: AppTheme.violetShade200,
          ),
          labelStyle: Styles.customTextStyle(),
          hintTextStyle: Styles.customTextStyle(),
          textStyle: Styles.customTextStyle(),
        ),
        SpaceH12(),
        CustomTextFormField(
          textInputType: TextInputType.text,
          labelText: StringConst.COUNTRY,
          border: Borders.customOutlineInputBorder(),
          enabledBorder: Borders.customOutlineInputBorder(),
          focusedBorder: Borders.customOutlineInputBorder(
            color: AppTheme.violetShade200,
          ),
          labelStyle: Styles.customTextStyle(),
          hintTextStyle: Styles.customTextStyle(),
          textStyle: Styles.customTextStyle(),
        ),
        SpaceH20(),
        CustomTextFormField(
          textInputType: TextInputType.text,
          labelText: StringConst.MESSAGE,
          border: Borders.customOutlineInputBorder(),
          enabledBorder: Borders.customOutlineInputBorder(),
          focusedBorder: Borders.customOutlineInputBorder(
            color: AppTheme.violetShade200,
          ),
          labelStyle: Styles.customTextStyle(),
          hintTextStyle: Styles.customTextStyle(),
          textStyle: Styles.customTextStyle(),
        ),
        SpaceH12(),
        Text(
          StringConst.UPLOAD_PROOF,
          style: theme.textTheme.subtitle.copyWith(
            color: AppTheme.blackShade10,
            fontSize: Sizes.TEXT_SIZE_14,
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              width: Sizes.WIDTH_120,
              decoration: Decorations.customBoxDecoration(blurRadius: 10),
              child: CustomButton(
                title: StringConst.CHOOSEFILE,
                borderRadius: Sizes.RADIUS_0,
                elevation: Sizes.ELEVATION_0,
                textStyle: theme.textTheme.subtitle2.copyWith(
                  color: AppTheme.white,
                  fontWeight: FontWeight.w600,
                ),
                color: AppTheme.grey,
                height: Sizes.HEIGHT_30,
                onPressed: () {
                  _getDocuments();
                },
              ),
            ),
            SpaceW8(),
            Text(
              StringConst.FILECHOOSEN,
              style: theme.textTheme.subtitle.copyWith(
                color: AppTheme.blackShade10,
                fontSize: Sizes.TEXT_SIZE_14,
              ),
            ),
          ],
        ),
        Text(
          StringConst.UPLOAD_PAN,
          style: theme.textTheme.subtitle.copyWith(
            color: AppTheme.blackShade10,
            fontSize: Sizes.TEXT_SIZE_14,
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              width: Sizes.WIDTH_120,
              decoration: Decorations.customBoxDecoration(blurRadius: 10),
              child: CustomButton(
                title: StringConst.CHOOSEFILE,
                borderRadius: Sizes.RADIUS_0,
                elevation: Sizes.ELEVATION_0,
                textStyle: theme.textTheme.subtitle2.copyWith(
                  color: AppTheme.white,
                  fontWeight: FontWeight.w600,
                ),
                color: AppTheme.grey,
                height: Sizes.HEIGHT_30,
                onPressed: () {
                  _getDocuments();
                },
              ),
            ),
            SpaceW8(),
            Text(
              StringConst.FILECHOOSEN,
              style: theme.textTheme.subtitle.copyWith(
                color: AppTheme.blackShade10,
                fontSize: Sizes.TEXT_SIZE_14,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Checkbox(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: AppTheme.blue,
            ),
            Text(
              StringConst.REMEMBER_ME,
              style: theme.textTheme.subtitle.copyWith(
                color: AppTheme.blackShade10,
                fontSize: Sizes.TEXT_SIZE_14,
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
        Container(
          width: Sizes.WIDTH_236,
          decoration: Decorations.customBoxDecoration(blurRadius: 10),
          child: CustomButton(
            title: StringConst.Apply,
            elevation: Sizes.ELEVATION_8,
            textStyle: theme.textTheme.subtitle2.copyWith(
              color: AppTheme.white,
              fontWeight: FontWeight.w600,
            ),
            color: AppTheme.green,
            height: Sizes.HEIGHT_40,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}

class Decorations {
  static customBoxDecoration({
    double blurRadius = 5,
    Color color = const Color(0xFFD6D7FB),
  }) {
    return BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: blurRadius, color: color)]);
  }
}

class SpaceH8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.0,
    );
  }
}

class SpaceH12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12.0,
    );
  }
}

class SpaceH20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.0,
    );
  }
}

class SpaceW8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 8.0,
    );
  }
}

class StringConst {
  static const String NAME = "Your Name*";
  static const String EMAIL_ADDRESS = "Your Email Address*";
  static const String MOBILE = "Your Mobile Number*";
  static const String ADDRESS = "Your Full Address*";
  static const String COUNTRY = "Select Country*";
  static const String REMEMBER_ME = "Accept Terms & Condition*";
  static const String UPLOAD_PAN = "Upload PAN (Max 4MB)*";
  static const String UPLOAD_PROOF = "Upload Company Proof (Max 5MB)*";
  static const String FILECHOOSEN = "No File Choosen";
  static const String Apply = "Apply";
  static const String CHOOSEFILE = "Choose File";
  static const String WELCOME_BACK = "Welcome back,";
  static const String Dealership = "Dealership!";
  static const String MESSAGE = "Your Message (optional)";
}

class Styles {
  static TextStyle customTextStyle({
    Color color = AppTheme.blackShade3,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = Sizes.TEXT_SIZE_14,
    FontStyle fontStyle: FontStyle.normal,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle customTextStyle2({
    Color color = AppTheme.blackShade7,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = Sizes.TEXT_SIZE_16,
    FontStyle fontStyle: FontStyle.normal,
  }) {
    return GoogleFonts.comfortaa(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    this.title,
    this.onPressed,
    this.height = Sizes.HEIGHT_50,
    this.elevation = Sizes.ELEVATION_1,
    this.borderRadius = Sizes.RADIUS_24,
    this.color = AppTheme.blackShade5,
    this.borderSide = Borders.defaultPrimaryBorder,
    this.textStyle,
    this.icon,
    this.hasIcon = false,
  });

  final VoidCallback onPressed;
  final double height;
  final double elevation;
  final double borderRadius;
  final String title;
  final Color color;
  final BorderSide borderSide;
  final TextStyle textStyle;
  final Widget icon;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: borderSide,
      ),
      height: height,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          hasIcon ? icon : Container(),
          hasIcon ? SpaceW8() : Container(),
          title != null
              ? Text(
                  title,
                  style: textStyle,
                )
              : Container(),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextStyle textStyle;
  final TextStyle hintTextStyle;
  final TextStyle labelStyle;
  final TextStyle titleStyle;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final String labelText;
  final String title;
  final bool obscured;
  final bool hasPrefixIcon;
  final bool hasSuffixIcon;
  final bool hasTitle;
  final bool hasTitleIcon;
  final Widget titleIcon;
  final TextInputType textInputType;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final InputBorder border;
  final InputBorder enabledBorder;
  final InputBorder focusedBorder;
  final double width;
  final double height;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry textFormFieldMargin;

  CustomTextFormField({
    this.prefixIcon,
    this.suffixIcon,
    this.textStyle,
    this.hintTextStyle,
    this.labelStyle,
    this.titleStyle,
    this.titleIcon,
    this.hasTitleIcon = false,
    this.title,
    this.contentPadding,
    this.textFormFieldMargin,
    this.hasTitle = false,
    this.border = Borders.primaryInputBorder,
    this.focusedBorder = Borders.focusedBorder,
    this.enabledBorder = Borders.enabledBorder,
    this.hintText,
    this.labelText,
    this.hasPrefixIcon = false,
    this.hasSuffixIcon = false,
    this.obscured = false,
    this.textInputType,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            hasTitleIcon ? titleIcon : Container(),
            hasTitle ? Text(title, style: titleStyle) : Container(),
          ],
        ),
        Container(
          width: width,
          height: height,
          margin: textFormFieldMargin,
          child: TextFormField(
            style: textStyle,
            keyboardType: textInputType,
            onChanged: onChanged,
            validator: validator,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              contentPadding: contentPadding,
              labelText: labelText,
              labelStyle: labelStyle,
              border: border,
              enabledBorder: enabledBorder,
              focusedBorder: focusedBorder,
              prefixIcon: hasPrefixIcon ? prefixIcon : null,
              suffixIcon: hasSuffixIcon ? suffixIcon : null,
              hintText: hintText,
              hintStyle: hintTextStyle,
            ),
            obscureText: obscured,
          ),
        ),
      ],
    );
  }
}

class Sizes {
  static const double TEXT_SIZE_20 = 20.0;
  static const double TEXT_SIZE_18 = 18.0;
  static const double TEXT_SIZE_16 = 16.0;
  static const double TEXT_SIZE_14 = 14.0;
  static const double TEXT_SIZE_12 = 12.0;
  static const double TEXT_SIZE_10 = 10.0;
  static const double TEXT_SIZE_8 = 8.0;

  static const double ICON_SIZE_24 = 24.0;
  static const double ICON_SIZE_22 = 22.0;
  static const double ICON_SIZE_20 = 20.0;
  static const double ICON_SIZE_18 = 18.0;
  static const double ICON_SIZE_16 = 16.0;
  static const double ICON_SIZE_14 = 14.0;
  static const double ICON_SIZE_12 = 12.0;
  static const double ICON_SIZE_10 = 10.0;
  static const double ICON_SIZE_8 = 8.0;

  static const double HEIGHT_60 = 60.0;
  static const double HEIGHT_50 = 50.0;
  static const double HEIGHT_48 = 48.0;
  static const double HEIGHT_46 = 46.0;
  static const double HEIGHT_44 = 44.0;
  static const double HEIGHT_40 = 40.0;
  static const double HEIGHT_36 = 36.0;
  static const double HEIGHT_32 = 32.0;
  static const double HEIGHT_30 = 30.0;
  static const double HEIGHT_25 = 25.0;
  static const double HEIGHT_24 = 24.0;
  static const double HEIGHT_22 = 22.0;
  static const double HEIGHT_20 = 20.0;
  static const double HEIGHT_18 = 18.0;
  static const double HEIGHT_16 = 16.0;
  static const double HEIGHT_14 = 14.0;
  static const double HEIGHT_10 = 10.0;
  static const double HEIGHT_8 = 8.0;
  static const double HEIGHT_4 = 4.0;

  static const double WIDTH_236 = 236.0;
  static const double WIDTH_200 = 200.0;
  static const double WIDTH_180 = 180.0;
  static const double WIDTH_170 = 170.0;
  static const double WIDTH_160 = 160.0;
  static const double WIDTH_150 = 150.0;
  static const double WIDTH_120 = 120.0;
  static const double WIDTH_100 = 100.0;
  static const double WIDTH_80 = 80.0;
  static const double WIDTH_60 = 60.0;
  static const double WIDTH_50 = 50.0;
  static const double WIDTH_40 = 40.0;
  static const double WIDTH_32 = 32.0;
  static const double WIDTH_30 = 30.0;
  static const double WIDTH_25 = 25.0;
  static const double WIDTH_24 = 24.0;
  static const double WIDTH_22 = 22.0;
  static const double WIDTH_20 = 20.0;
  static const double WIDTH_18 = 18.0;
  static const double WIDTH_16 = 16.0;
  static const double WIDTH_14 = 14.0;
  static const double WIDTH_12 = 12.0;
  static const double WIDTH_10 = 10.0;
  static const double WIDTH_8 = 8.0;
  static const double WIDTH_6 = 6.0;
  static const double WIDTH_4 = 4.0;
  static const double WIDTH_2 = 2.0;
  static const double WIDTH_1 = 1.0;
  static const double WIDTH_0 = 0.0;

  static const double MARGIN_60 = 60.0;
  static const double MARGIN_48 = 48.0;
  static const double MARGIN_46 = 46.0;
  static const double MARGIN_44 = 44.0;
  static const double MARGIN_40 = 40.0;
  static const double MARGIN_36 = 36.0;
  static const double MARGIN_32 = 32.0;
  static const double MARGIN_30 = 30.0;
  static const double MARGIN_26 = 26.0;
  static const double MARGIN_24 = 24.0;
  static const double MARGIN_22 = 22.0;
  static const double MARGIN_20 = 20.0;
  static const double MARGIN_18 = 18.0;
  static const double MARGIN_16 = 16.0;
  static const double MARGIN_14 = 14.0;
  static const double MARGIN_12 = 12.0;
  static const double MARGIN_10 = 10.0;
  static const double MARGIN_8 = 8.0;
  static const double MARGIN_4 = 4.0;
  static const double MARGIN_0 = 0.0;

  static const double PADDING_36 = 36.0;
  static const double PADDING_32 = 32.0;
  static const double PADDING_24 = 24.0;
  static const double PADDING_22 = 22.0;
  static const double PADDING_20 = 20.0;
  static const double PADDING_18 = 18.0;
  static const double PADDING_16 = 16.0;
  static const double PADDING_14 = 14.0;
  static const double PADDING_12 = 12.0;
  static const double PADDING_10 = 10.0;
  static const double PADDING_8 = 8.0;
  static const double PADDING_4 = 4.0;
  static const double PADDING_2 = 2.0;
  static const double PADDING_0 = 0.0;

  static const double RADIUS_32 = 32.0;
  static const double RADIUS_30 = 30.0;
  static const double RADIUS_24 = 24.0;
  static const double RADIUS_22 = 22.0;
  static const double RADIUS_20 = 20.0;
  static const double RADIUS_18 = 18.0;
  static const double RADIUS_16 = 16.0;
  static const double RADIUS_14 = 14.0;
  static const double RADIUS_12 = 12.0;
  static const double RADIUS_10 = 10.0;
  static const double RADIUS_8 = 8.0;
  static const double RADIUS_6 = 6.0;
  static const double RADIUS_4 = 4.0;
  static const double RADIUS_0 = 0.0;

  //Elevations
  static const double ELEVATION_16 = 16.0;
  static const double ELEVATION_14 = 14.0;
  static const double ELEVATION_12 = 12.0;
  static const double ELEVATION_10 = 10.0;
  static const double ELEVATION_8 = 8.0;
  static const double ELEVATION_6 = 6.0;
  static const double ELEVATION_4 = 4.0;
  static const double ELEVATION_2 = 2.0;
  static const double ELEVATION_1 = 1.0;
  static const double ELEVATION_0 = 0.0;
}

@immutable
class ClipShadowPath extends StatelessWidget {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  ClipShadowPath({
    @required this.shadow,
    @required this.clipper,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowPainter(
        clipper: this.clipper,
        shadow: this.shadow,
      ),
      child: ClipPath(child: child, clipper: this.clipper),
    );
  }
}

class _ClipShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowPainter({@required this.shadow, @required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class LoginDesign4ShapeClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height * 0.8);

    var firstEndpoint = Offset(size.width * 0.6, size.height * 0.55);
    var firstControlPoint = Offset(size.width * 0.40, size.height);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndpoint.dx, firstEndpoint.dy);

    var secondEndpoint = Offset(size.width * 0.8, size.height * 0.35);
    var secondControlPoint = Offset(size.width * 0.7, size.height * 0.35);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndpoint.dx, secondEndpoint.dy);

    var thirdEndpoint = Offset(size.width * 0.9, size.height * 0.25);
    var thirdControlPoint = Offset(size.width * 0.9, size.height * 0.35);

    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndpoint.dx, thirdEndpoint.dy);

    var fourthEndpoint = Offset(size.width * 0.78, size.height * 0.15);
    var fourthControlPoint = Offset(size.width * 0.9, size.height * 0.15);

    path.quadraticBezierTo(fourthControlPoint.dx, fourthControlPoint.dy,
        fourthEndpoint.dx, fourthEndpoint.dy);

    var fifthEndpoint = Offset(size.width * 0.5, size.height * 0);
    var fifthControlPoint = Offset(size.width * 0.6, size.height * 0.15);

    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
        fifthEndpoint.dx, fifthEndpoint.dy);
//    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
