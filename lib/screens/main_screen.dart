
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_demo/data/api/category_api.dart';
import 'package:http_demo/data/api/product_api.dart';
import 'package:http_demo/models/product.dart';
import 'package:http_demo/widgets/product_list_widget.dart';

import '../models/category.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StatefulWidgetState();
  }

}

class _StatefulWidgetState extends State {
  List<Category> categories =List<Category>.empty();//kategori listem
  List<Widget> categoryWidgets=List<Widget>.empty();//kategori butonlarım
  List<Product> products=List<Product>.empty();
  @override
  void initState() {//initState içinde animasyonları ayarlayabilir, platform servislerine abone olabilir veya API’den veri çekebilir
    //burada apiyi çekiyoruz.
    getCategoriesFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Alışveriş Sistemi",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: categoryWidgets,),
            ),
            ProductListWidget(products),
          ],
        ),
      ),
    );
  }
  
  void getCategoriesFromApi() {//api den kategori listesi oluşturuldu. elimizde kategori nesnesinin olduğu nesne var.
                               //Bu nesneleri widget a çevirip. her eleman için bir buton oluşturuyoruz.
    CategoryApi.getCategories().then((value){
        setState(() {
          Iterable list=  json.decode(value.body);
          categories=list.map((e) => Category.fromJson(e)).toList();
          getCategoryWidgets();
          print(value.body);
        });
    });
  }
  
  void getCategoryWidgets() {
    for(int i=0;i<categories.length;i++){
      categoryWidgets.add(butonOlustur(categories[i]));//categories listesinin o anki elemanı için buton oluşturuyoruz.
      print(categoryWidgets);
    }
  }
  
  Widget butonOlustur(Category categori) {
    return ElevatedButton(
      child: Text(categori.categoryName,style: const TextStyle(color: Colors.blueGrey),),
      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),side: const BorderSide(color: Colors.blueAccent)),
      onPressed: (){
        getProductsByCategoryId(categori);

      },
      
      );
  }
  
  void getProductsByCategoryId(Category categori) {
    ProductApi.getProducts().then((value){
      setState(() {
        Iterable list=json.decode(value.body);
        products=list.map((e) => Product.fromJson(e)).toList();
      });
    });
  }

}