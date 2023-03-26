class Product {
  late String id;
  String? name;
  String? price;
  String? urlImage;

  Product({required this.id, this.name, this.price, this.urlImage});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    urlImage = json['urlImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['urlImage'] = urlImage;
    return data;
  }
}
