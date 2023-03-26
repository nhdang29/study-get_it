import 'model/product.dart';

class ProductManager {
  ProductManager();

  List<Product> products = [
    Product(id: "1", name: "sting", price: "9000", urlImage: "nothing"),
    Product(id: "2", name: "red bull", price: "12000", urlImage: "nothing"),
    Product(id: "3", name: "lays snack", price: "5000", urlImage: "nothing"),
  ];
  
  List<Product> get productList => [...products];
  
  Product get firstItem => products.first;
  
  void addProduct(Product prod){
    products.add(
      Product(
        id: DateTime.now().toIso8601String(),
        name: prod.name,
        price: prod.price,
        urlImage: prod.urlImage
      )
    );
  }

  void deleteProduct(Product prod){
    products.remove(prod);
  }

  void deleteById(String id){
    final index = products.indexWhere((element) => element.id == id);
    products.removeAt(index);
  }

  void editNameById(String id, String name){
    var index = products.indexWhere((item) => item.id == id);
    if(index >= 0){
      products[index].name = name;
    }
  }
  
  void editProduct(Product prod){
    var index = products.indexWhere((item) => item.id == prod.id);
    if(index >= 0){
      products[index].name = prod.name;
      products[index].price = prod.price;
      products[index].urlImage = prod.urlImage;
    }
  }

}