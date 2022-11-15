import 'package:pr2/domain/entity/cartstatus_entity.dart';

class CartStatus extends CartStatusEntity {
  CartStatus({required super.name});

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
    };
  }

  factory CartStatus.fromMap(Map<String, dynamic> map) {
    return CartStatus(
      name: map['Name'] ?? '',
    );
  }
}
