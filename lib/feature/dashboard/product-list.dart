import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:kriyaflutter/feature/dashboard/repository.dart';
import 'package:kriyaflutter/model/product.dart';

class ProductList extends StatefulWidget {

  final List<Product>  products ;

  ProductList({Key key, this.products}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  Widget _addRemoveCartButtons(Product product) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton.icon(
            onPressed: () {
              setState(() {
                product.qty++;
              });
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
              product.qty.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ) ,

        RaisedButton.icon(
            onPressed: () {
              setState(() {
                if (product.qty > 0) {
                  product.qty--;
                }
              });
            },
            icon: Icon(Icons.remove),
            label: Text('')),
      ],
    );
  }

  Widget _shoppingCartBadge(Product product) {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        product.qty.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
        ProductRepository.productCart.add(product);
      }),
    );
  }



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 3,
//      ),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget> [
            new Image.asset('assets/images/kriya-icon.png',
              height: 100,
              width: 100,
            ),
            Center(child: Text(widget.products[index].title)),
//            SizedBox(height: 100),SizedBox(height: 100),
            _addRemoveCartButtons(widget.products[index]),
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
}
