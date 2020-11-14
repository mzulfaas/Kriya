class Product {
// final int userId;
// final int id;
 final int qty;
 final String title;
// final bool completed;

  Product({ this.title, this.qty});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(

        title : json['title'] as String,
        qty : json['qty'] as int,
    );
  }

  static List<Product> getProductList(dynamic json){
    List <Product> daftarProduct = json.cast<List<Product>>();
}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['userId'] = this.userId;
//    data['id'] = this.id;
    data['title'] = this.title;
    data['qty'] = this.qty;
    return data;
  }
}