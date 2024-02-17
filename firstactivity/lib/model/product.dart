import 'package:flutter/material.dart';

class Product {
  final String ImageUrl;
  final String name;
  final String price;

  Product ({required this.ImageUrl, required this.name, required this.price});
}

List<Product> mockProducts = [
  Product(ImageUrl: 'assets/sneaker.png', name: 'Sneaker', price: '1000'),
  Product(ImageUrl: 'assets/sneaker.png', name: 'Sneaker', price: '1000'),
  Product(ImageUrl: 'assets/sneaker.png', name: 'Sneaker', price: '1000'),
];