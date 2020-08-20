import 'package:flutter/material.dart';


class Broucher extends StatefulWidget {
  @override
  _BroucherState createState() => _BroucherState();
}

class _BroucherState extends State<Broucher> {
  bool _isLoading = true;
/*  PDFDocument document;*/

  @override
  void initState() {
    super.initState();
   /* loadDocument();*/
  }

  /*loadDocument() async {
    document = await PDFDocument.fromURL(
        "https://www.dreamcil.com/wp-content/uploads/2020/06/Dreamcil_Broucher.pdf");
    setState(() => _isLoading = false);
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
    /*    body: Center(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : PDFViewer(document: document)),*/
      ),
    );
  }
}