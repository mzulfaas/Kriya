import 'package:flutter/material.dart';
import 'package:kriyaflutter/model/product.dart';

class CheckoutPage extends StatefulWidget {



  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Colors.black
        ),
        title: Text("Checkout"),
        centerTitle: true,
      ),
    );
  }
}


