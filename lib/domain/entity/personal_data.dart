
class PersonalData {
  int id;
  String name;
  String lName;
  String patronymic;
  PersonalData(
    this.id,
    this.name,
    this.lName,
    this.patronymic,
  );

  PersonalData copyWith({
    int? id,
    String? name,
    String? lName,
    String? patronymic,
  }) {
    return PersonalData(
      id ?? this.id,
      name ?? this.name,
      lName ?? this.lName,
      patronymic ?? this.patronymic,
    );
  }

}
