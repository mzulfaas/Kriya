import 'dart:convert';
import 'dart:async';
import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kriyaflutter/model/product.dart';



//Future<Product> fetchProduct() async {
//  final response = await http.get('https://jsonplaceholder.typicode.com/todos/');
//  print(response.body);
//  final jsonresponse = jsonDecode(response.body);
//
//  if (response.statusCode == 200) {
//    // If the server did return a 200 OK response,
//    // then parse the JSON.
//    // return Product.fromJson(jsonDecode(response.body));
//    print(200);
//    return Product.fromJson(jsonresponse[0]);
//
//  } else {
//    // If the server did not return a 200 OK response,
//    // then throw an exception.
//    throw Exception('Failed to load album');
//  }
//}



//Ini ParseStatless...
Future<List<Product>> fetchProduct(http.Client client) async {
  final response =
  await client.get('https://jsonplaceholder.typicode.com/todos/');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseProduct, response.body);
}

List<Product> parseProduct(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}



