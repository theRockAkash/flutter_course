import 'category_item.dart';

/// id : 3
/// title : "Classic Heather Gray Hoody"
/// slug : "classic-heather-gray-hoody"
/// price : 69
/// description : "Stay cozy and stylish with our Classic Heather Gray Hoodie. Crafted from soft, durable fabric, it features a kangaroo pocket, adjustable drawstring hood, and ribbed cuffs. Perfect for a casual day out or a relaxing evening in, this hoodie is a versatile addition to any wardrobe."
/// category : {"id":1,"name":"Clothes","slug":"clothes","image":"https://i.imgur.com/QkIa5tT.jpeg","creationAt":"2025-09-18T19:54:42.000Z","updatedAt":"2025-09-18T19:54:42.000Z"}
/// images : ["https://i.imgur.com/cHddUCu.jpeg","https://i.imgur.com/CFOjAgK.jpeg","https://i.imgur.com/wbIMMme.jpeg"]
/// creationAt : "2025-09-18T19:54:42.000Z"
/// updatedAt : "2025-09-19T06:07:53.000Z"

class Product {
  Product({
      this.id, 
      this.title, 
      this.slug, 
      this.price, 
      this.description, 
      this.category, 
      this.images, 
      this.creationAt, 
      this.updatedAt,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    images = json['images'] != null ? json['images'].cast<String>() : [];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  num? id;
  String? title;
  String? slug;
  num? price;
  String? description;
  Category? category;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
Product copyWith({  num? id,
  String? title,
  String? slug,
  num? price,
  String? description,
  Category? category,
  List<String>? images,
  String? creationAt,
  String? updatedAt,
}) => Product(  id: id ?? this.id,
  title: title ?? this.title,
  slug: slug ?? this.slug,
  price: price ?? this.price,
  description: description ?? this.description,
  category: category ?? this.category,
  images: images ?? this.images,
  creationAt: creationAt ?? this.creationAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['price'] = price;
    map['description'] = description;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    map['images'] = images;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}
