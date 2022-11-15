
class CartStatusEntity {

  const CartStatusEntity({
    required this.name,
  });

  final String name;

  CartStatusEntity copyWith({
    String? name,
  }) {
    return CartStatusEntity(
      name: name ?? this.name,
    );
  }

}
