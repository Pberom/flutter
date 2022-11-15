
import 'package:pr2/domain/entity/category_entity.dart';

class Category extends CategoryEntity{
  Category({required super.name});

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['Name'],
    );
  }

}