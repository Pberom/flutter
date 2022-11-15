
import 'package:pr2/domain/entity/role_entity.dart';
import 'package:pr2/domain/entity/user_entity.dart';

class User extends UserEntity {

  User({
    super.id = 0,
    required super.login,
    required super.password,
    required super.idRole,
  });

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'password': password,
      'id_role': idRole.id,
    };
  }

  factory User.toFromMap(Map<String, dynamic> json) {
    return User(
      id: (json['id'] as int),
      login: json['login'],
      password: json['password'],
      idRole: RoleEnum.values.firstWhere(
        (element) => element.id == (json['id_role'] as int),
      ),
    );
  }
}
