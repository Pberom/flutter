
import 'package:pr2/domain/entity/category_entity.dart';


class ProductEntity {
  int id;
  String name;
  String description;
  CategoryEntity category;
  double price;
  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
  });



 
}
