import 'package:e_commerce/data/model/categoriesResponse/CategoryDto.dart';
import 'package:e_commerce/domain/model/Product.dart';

import '../../../domain/model/Category.dart';
import 'SubcategoryDto.dart';

/// sold : 43428
/// images : ["https://ecommerce.routemisr.com/Route-Academy-products/1680395220690-1.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680395220693-3.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680395220692-2.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680395220713-4.jpeg"]
/// subcategory : [{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}]
/// ratingsQuantity : 19
/// _id : "6428cbd5dc1175abc65ca037"
/// title : "Essentials Embroidered Linear Logo T-Shirt Navy"
/// slug : "essentials-embroidered-linear-logo-t-shirt-navy"
/// description : "Comfortable and soft cotton blend fabric\nRibbed crew neck and short sleeves\nadidas signature branding print\nWash according to care label instructions"
/// quantity : 118
/// price : 749
/// priceAfterDiscount : 504
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680395220407-cover.jpeg"
/// category : {"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"}
/// brand : null
/// ratingsAverage : 3.8
/// createdAt : "2023-04-02T00:27:01.864Z"
/// updatedAt : "2023-12-06T12:32:55.012Z"
/// id : "6428cbd5dc1175abc65ca037"

class Data {
  Data({
      this.sold, 
      this.images, 
      this.subcategory,
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.priceAfterDiscount, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt, 
      });

  Data.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    imageCover = json['imageCover'];
    category = (json['category'] != null ? Category.fromJson(json['category']) : null) as Category?;
    brand = json['brand'];
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }
  int? sold;
  List<String>? images;
  List<SubcategoryDto>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  int? priceAfterDiscount;
  String? imageCover;
  Category? category;
  dynamic brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
Data copyWith({  int? sold,
  List<String>? images,
  List<SubcategoryDto>? subcategory,
  int? ratingsQuantity,
  String? id,
  String? title,
  String? slug,
  String? description,
  int? quantity,
  int? price,
  int? priceAfterDiscount,
  String? imageCover,
  Category? category,
  dynamic brand,
  num? ratingsAverage,
  String? createdAt,
  String? updatedAt,
}) => Data(  sold: sold ?? this.sold,
  images: images ?? this.images,
  subcategory: subcategory ?? this.subcategory,
  ratingsQuantity: ratingsQuantity ?? this.ratingsQuantity,
  id: id ?? this.id,
  title: title ?? this.title,
  slug: slug ?? this.slug,
  description: description ?? this.description,
  quantity: quantity ?? this.quantity,
  price: price ?? this.price,
  priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
  imageCover: imageCover ?? this.imageCover,
  category: category ?? this.category,
  brand: brand ?? this.brand,
  ratingsAverage: ratingsAverage ?? this.ratingsAverage,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sold'] = sold;
    map['images'] = images;
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['ratingsQuantity'] = ratingsQuantity;
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['priceAfterDiscount'] = priceAfterDiscount;
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    map['brand'] = brand;
    map['ratingsAverage'] = ratingsAverage;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['id'] = id;
    return map;
  }

  Product toProduct(){
    return Product(
        id: id,
        slug: slug,
        title: title,
        brand: brand,
        category: category,
        description: description,
        images: images,
        imageCover: imageCover,
        price: price,
        priceAfterDiscount: priceAfterDiscount,
        quantity: quantity,
        ratingsAverage: ratingsAverage,
        ratingsQuantity: ratingsQuantity,
        sold: sold,
        subcategory: subcategory,
    );
  }

}