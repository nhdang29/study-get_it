import 'package:flutter/material.dart';
import 'package:flutter_getx_project/products_manager.dart';
import 'package:get/get.dart';

import 'model/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TextEditingController nameController = TextEditingController();
    ProductManager products = ProductManager();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: products.productList.map((prod) => itemProduct(prod, products)).toList(),
        ),
      ),
    );
  }
}

Widget itemProduct(Product prod, ProductManager prodManager){

  RxBool isEdit = false.obs;

  return Obx(() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: !isEdit.value
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(prod.name!),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: (){
              isEdit.value = !isEdit.value;
            },
          ),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              initialValue: prod.name!,
              autofocus: true,
              onChanged: (value){
                prod.name = value;
                prodManager.editProduct(prod);
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: (){
              isEdit.value = !isEdit.value;
            },
          ),
        ],
      )
    )
  );
}
