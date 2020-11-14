import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
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
      body: StreamBuilder(
      ),
    );
  }
}


