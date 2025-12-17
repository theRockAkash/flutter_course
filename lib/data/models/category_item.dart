/// id : 23
/// name : "Shoes"
/// slug : "shoes"
/// image : "https://i.imgur.com/qNOjJje.jpeg"
/// creationAt : "2025-09-15T06:19:55.000Z"
/// updatedAt : "2025-09-15T06:19:55.000Z"

class CategoryItem {
  CategoryItem({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      this.creationAt, 
      this.updatedAt,});

  CategoryItem.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  num? id;
  String? name;
  String? slug;
  String? image;
  String? creationAt;
  String? updatedAt;
  CategoryItem copyWith({  num? id,
  String? name,
  String? slug,
  String? image,
  String? creationAt,
  String? updatedAt,
}) => CategoryItem(  id: id ?? this.id,
  name: name ?? this.name,
  slug: slug ?? this.slug,
  image: image ?? this.image,
  creationAt: creationAt ?? this.creationAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}