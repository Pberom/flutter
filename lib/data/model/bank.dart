import 'package:pr2/domain/entity/bank_entity.dart';

class Bank extends BankEntity {
  Bank(super.id, super.cardNumber, super.expDate, super.cvc);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'CardNumber': cardNumber,
      'CardExp': expDate.millisecondsSinceEpoch,
      'CardCVC': cvc,
    };
  }

  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
      map['id'],
      map['CardNumber'],
      DateTime(map['CardExp']),
      map['CardCVC'],
    );
  }
}
