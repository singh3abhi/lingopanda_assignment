class HomeProductsData {
  List<Product>? products;

  HomeProductsData({this.products});

  HomeProductsData.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  num? id;
  String? title;
  String? description;
  String? category;
  num? price;
  num? discountPercentage;
  String? brand;
  String? sku;
  List<String>? images;
  String? thumbnail;

  Product({this.id, this.title, this.description, this.category, this.price, this.discountPercentage, this.brand, this.sku, this.images, this.thumbnail});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    brand = json['brand'];
    sku = json['sku'];
    images = json['images'].cast<String>();
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['category'] = category;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['brand'] = brand;
    data['sku'] = sku;
    data['images'] = images;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
