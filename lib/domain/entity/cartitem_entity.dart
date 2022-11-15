import 'package:pr2/domain/entity/product_entity.dart';

class CartItemEntity {
  int id;
  ProductEntity product;
  int productAmount;
  int cartID;
  CartItemEntity({
    required this.cartID,
    required this.id,
    required this.product,
    required this.productAmount,
  });
}
