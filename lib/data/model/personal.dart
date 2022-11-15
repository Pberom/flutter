
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

  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Name': name,
      'LName': lName,
      'Patronymic': patronymic,
    };
  }

  factory PersonalData.fromMap(Map<String, dynamic> map) {
    return PersonalData(
      map['id']?.toInt() ?? 0,
      map['Name'] ?? '',
      map['LName'] ?? '',
      map['Patronymic'] ?? '',
    );
  }



}
