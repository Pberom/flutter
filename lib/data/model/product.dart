
import 'package:pr2/data/model/category.dart';
import 'package:pr2/domain/entity/product_entity.dart';

class Product extends ProductEntity {
  Product(
      {required super.id,
      required super.name,
      required super.description,
      required super.category,
      required super.price});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Name': name,
      'Description': description,
      'Category_Name': Category(name: category.name).toMap(),
      'Price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      name: map['Name'] ?? '',
      description: map['Description'] ?? '',
      category: Category.fromMap(map['Category_Name']),
      price: map['Price']?.toDouble() ?? 0.0,
    );
  }


  
}
