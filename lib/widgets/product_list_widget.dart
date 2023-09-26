import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';

class ProductListWidget extends StatefulWidget{

  List<Product> products=List<Product>.empty();
  ProductListWidget(List<Product> products){
    products=products;
  }
  
  @override
  State<StatefulWidget> createState() {
    return ProductListWidgetState();
  }
}

class ProductListWidgetState extends State <ProductListWidget>{//aşağıdan yukarıya erişmeyi sağlıyor. genericleştirdik
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }
  
  Widget buildProductList(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemCount: widget.products.length, itemBuilder: (context,index){
        return Text(widget.products[index].productName);
      }),
    );

  }
}