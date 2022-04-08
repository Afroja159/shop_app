import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shop_app/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 30,
      "price": 26,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 26,
      "price": 20,
    },
    {
      "name": "Frock",
      "picture": "images/products/frock1.jpg",
      "old_price": 16,
      "price": 13,
    },
    {
      "name": "Tunic",
      "picture": "images/products/tunic1.jpg",
      "old_price": 12,
      "price": 10,
    },
    {
      "name": "T-Shirt",
      "picture": "images/products/tshirt1.jpg",
      "old_price": 8,
      "price": 6,
    },
    {
      "name": "Candle",
      "picture": "images/products/accessories1.jpg",
      "old_price": 3,
      "price": 2,
    },
    {
      "name": "Ladies sandals",
      "picture": "images/products/sandals1.jpg",
      "old_price": 11,
      "price": 9,
    },
    {
      "name": "Wallet",
      "picture": "images/products/accessories2.jpg",
      "old_price": 13,
      "price": 11,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  //here we are passing the values of the product to the product details page
                  builder: (context) => ProductDetails(
                        product_detail_name: prod_name,
                        product_detail_old_price: prod_old_price,
                        product_detail_new_price: prod_price,
                        product_detail_picture: prod_picture,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\$$prod_price",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\$$prod_old_price",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
