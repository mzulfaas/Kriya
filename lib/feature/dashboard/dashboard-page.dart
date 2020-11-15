import 'package:flutter/material.dart';
import 'package:kriyaflutter/checkout/checkout-page.dart';
import 'package:kriyaflutter/feature/dashboard/dashboard-presenter.dart';
import 'package:kriyaflutter/feature/dashboard/product-list.dart';
import 'package:kriyaflutter/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart';
import 'package:flutter_cart/flutter_cart.dart';


//DashboardparseStateless........
class DashboardPage extends StatefulWidget {
  final String title;

  DashboardPage({Key key, this.title}) : super (key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kriya"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage()));
            }
          )
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: fetchProduct(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ProductList(products: snapshot.data);
            } else if (snapshot.hasError) {
              return Text("Ada Error nih");
            } else {
              return Text("Entah kenapa");
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Text("Entah deh");
          }
        },
      ),
    );
  }
}


