import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/services.dart';

import 'package:dreamcil/Signin/models/user.dart';
import 'package:dreamcil/Signin/util/auth.dart';
import 'package:dreamcil/Signin/util/validator.dart';
import 'package:dreamcil/Signin/ui/widgets/loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'Widgets/StarRating.dart';

class ProductAdd extends StatefulWidget {
  _AddproductScreenState createState() => _AddproductScreenState();
}

class _AddproductScreenState extends State<ProductAdd> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _productName = new TextEditingController();
  final TextEditingController _price = new TextEditingController();
  final TextEditingController _lastName = new TextEditingController();
  final TextEditingController _discountpercentage = new TextEditingController();
  final TextEditingController _discountprice = new TextEditingController();
  final firestoreInstance = Firestore.instance;
  double rating = 3.5;

  bool _autoValidate = false;
  bool _loadingVisible = false;
  File _image;
  String _uploadedFileURL;

  @override
  void initState() {
    super.initState();
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  Future uploadFile() async {
    _changeLoadingVisible();
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('chats/${_image.path}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      _changeLoadingVisible();
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });
  }

  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 60.0,
          child: ClipOval(
            child: Image.asset(
              'assets/images/userImage.png',
              fit: BoxFit.cover,
              width: 120.0,
              height: 120.0,
            ),
          )),
    );
    final upload = Column(
      children: <Widget>[
        _image == null
            ? Image.asset(
                'assets/images/cart_empty.png',
                height: 150,
              )
            : _uploadedFileURL != null
                ? Image.network(
                    _uploadedFileURL,
                    height: 150,
                  )
                : Image.file(
                    _image,
                    height: 150,
                  ),
        _image == null
            ? RaisedButton(
                child: Text('Choose File'),
                onPressed: chooseFile,
                color: Colors.cyan,
              )
            : Container(),
        _image != null
            ? RaisedButton(
                child: Text('Upload File'),
                onPressed: uploadFile,
                color: Colors.cyan,
              )
            : Container(),
      ],
    );

    final productName = TextFormField(
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      controller: _productName,
      validator: Validator.validateName,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.account_balance_wallet,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Product Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    ;

    final price = TextFormField(
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      controller: _price,
      validator: Validator.validatePrice,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.account_balance,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Price',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final discountprice = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: _discountpercentage,
      validator: Validator.validatePrice,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.indeterminate_check_box,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Discount price',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final discountpercentage = TextFormField(
      autofocus: false,
      controller: _discountprice,
      validator: Validator.validatePrice,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.whatshot,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Discount Percentage',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final signUpButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          _addProducts(
              productName: _productName.text,
              pic: _lastName.text,
              email: _discountpercentage.text,
              mobilenumber: _price.text,
              password: _discountprice.text,
              context: context);
        },
        padding: EdgeInsets.all(12),
        color: Theme.of(context).primaryColor,
        child: Text('Add Product', style: TextStyle(color: Colors.white)),
      ),
    );

    final signInLabel = FlatButton(
      child: Text(
        'Have an Account? Sign In.',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/signin');
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingScreen(
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 48.0),
                      logo,
                      SizedBox(height: 48.0),
                      productName,
                      SizedBox(height: 24.0),
                      price,
                      SizedBox(height: 24.0),
                      discountprice,
                      SizedBox(height: 24.0),
                      discountpercentage,
                      SizedBox(height: 12.0),
                      upload,
                      SizedBox(height: 12.0),
                      StarRating(
                        rating: rating,
                        onRatingChanged: (rating) =>
                            setState(() => this.rating = rating),
                      ),
                      signUpButton,
                    ],
                  ),
                ),
              ),
            ),
          ),
          inAsyncCall: _loadingVisible),
    );
  }

  Future<void> _changeLoadingVisible() async {
    setState(() {
      _loadingVisible = !_loadingVisible;
    });
  }

  void _addProducts(
      {String productName,
      String pic,
      String email,
      String mobilenumber,
      String password,
      BuildContext context}) async {
    if (_formKey.currentState.validate()) {
      try {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        if (_uploadedFileURL != null) {
          _changeLoadingVisible();
          firestoreInstance.collection("products").add({
            "name": _productName.text,
            "pic": _uploadedFileURL,
            "Price": _price.text,
            "Discountprice": _discountprice.text,
            "Discountpercentage": _discountpercentage.text,
            "rating": rating.toString(),
          }).then((value) {
            print(value.documentID);
            _changeLoadingVisible();
            cleardata();
          });
        } else {
          Fluttertoast.showToast(msg: 'Please Upload An Image');
        }
        //need await so it has chance to go through error if found.
        //now automatically login user too
        //await StateWidget.of(context).logInUser(email, password);
      } catch (e) {
        _changeLoadingVisible();
        print("Sign Up Error: $e");
        String exception = Auth.getExceptionText(e);
        Flushbar(
          title: "Sign Up Error",
          message: exception,
          duration: Duration(seconds: 5),
        )..show(context);
      }
    } else {
      setState(() => _autoValidate = true);
    }
  }

  void cleardata() {
    _discountpercentage.clear();
    _discountprice.clear();
    _lastName.clear();
    _productName.clear();
    _price.clear();
    setState(() {
      _uploadedFileURL==null;
      _image=null;
    });
  }
}
