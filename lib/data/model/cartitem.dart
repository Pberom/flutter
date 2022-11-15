import 'package:pr2/data/model/product.dart';
import 'package:pr2/domain/entity/cartitem_entity.dart';
import 'package:pr2/domain/entity/product_entity.dart';

class CartItem extends CartItemEntity {
  CartItem(
      {required super.id,
      required super.cartID,
      required super.product,
      required super.productAmount});

  Map<String, dynamic> toMap() {
    return {
      'Cart_ID': cartID,
      'id': id,
      'Product_ID': product.id,
      'productAmount': productAmount,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      cartID: map['Cart_ID'],
      id: map['id']?.toInt() ?? 0,
      product: Product.fromMap(map['product']),
      productAmount: map['productAmount']?.toInt() ?? 0,
    );
  }
}
