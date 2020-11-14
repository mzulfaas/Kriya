import 'package:flutter/material.dart';
import 'package:kriyaflutter/checkout/checkout-page.dart';
import 'package:kriyaflutter/feature/dashboard/dashboard-presenter.dart';
import 'package:kriyaflutter/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart';
import 'package:flutter_cart/flutter_cart.dart';

//class DashboardPage extends StatefulWidget {
//  @override
//  _DashboardPageState createState() => _DashboardPageState();
//}
//
//class _DashboardPageState extends State<DashboardPage> {
//  Future<Product> futureProduct;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    futureProduct = fetchProduct();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//            ('Kriya'),
//        ),
//      ),
//      body: Center(
//        child: FutureBuilder<Product>(
//          future: futureProduct,
//          builder: (context, snapshot){
//            if (snapshot.hasData){
//              return Text(
//                snapshot.data.title
//              );
//            }else if (snapshot.hasError){
//              return Text("${snapshot.error}");
//            }
//            return CircularProgressIndicator();
//          },
//        ),
//      ),
//    );
//  }
//}

//DashboardparseStateless........
class DashboardPage extends StatelessWidget {
  final String title;

  DashboardPage({Key key, this.title}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kriya"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage(),));
            }
          )
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: fetchProduct(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ProductsList(products: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  final List<Product>  products ;

  ProductsList({Key key, this.products}) : super(key: key);

  int _counter = 0;
  bool showRaisedButtonBadge = true;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 3,
//      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget> [
            new Image.asset('assets/images/kriya-icon.png',
              height: 100,
              width: 100,
            ),
            Center(child: Text(products[index].title)),
//            SizedBox(height: 100),SizedBox(height: 100),
            _addRemoveCartButtons(context),
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {

              },
            ),
          ],
        );
      },
    );
  }

  Widget _shoppingCartBadge(BuildContext context) {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        _counter.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
    );
  }

  Widget _addRemoveCartButtons(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton.icon(
            onPressed: () {

                _counter++;

            },
            icon: Icon(Icons.add),
            label: Text("")),
        RaisedButton(
          color:  Colors.grey ,
          onPressed: () {},
          child:Badge(
            badgeColor: Colors.grey,
            position: BadgePosition.topEnd(top: 0, end: 3),
            animationDuration: Duration(milliseconds: 300),
            borderRadius: null,
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              _counter.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ) ,

        RaisedButton.icon(
            onPressed: () {
              if (_counter > 0) {

                  _counter--;

              }
            },
            icon: Icon(Icons.remove),
            label: Text('')),
      ],
    );
  }
}

