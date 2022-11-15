class RoleEntity {
  late int id;
  final String name;

  RoleEntity({
    required this.name,
  });
}

enum RoleEnum {
  admin(id: 1, name: 'Администратор'),
  user(id: 2, name: 'Пользователь');

  const RoleEnum({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;
}
