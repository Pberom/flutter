abstract class DataBaseRequest {
  static const String tableRole = 'role';
  static const String tableUser = 'user';
  static const String tableProducts = 'product';
  static const String tableCategory = 'category';
  static const String tableCart = 'cart';
  static const String tableCartStatus = 'cartstatus';
  static const String tableCartItem = 'cartitem';
  static const String tablePersonalData = 'personaldata';
  static const String tableBankData = 'bankdata';
  static String deleteTable(String table) => 'DROP TABLE $table';

  static const List<String> tableList = [
    tableRole,
    tableUser,
    tableProducts,
    tableCategory,
    tableCartStatus,
    tableCartItem,
    tablePersonalData,
    tableBankData
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableCartStatus,
    _createTableCategory,
    _createTableUsers,
    _createTableCart,
    _createTableProducts,
    _createTableCartItem,
    _createTableBankData,
    _createTablePersonalData
  ];

  static const String _createTableRole = '''CREATE TABLE "$tableRole" (
        "id" INTEGER,
        "role" TEXT NOT NULL UNIQUE, 
        PRIMARY KEY("id" AUTOINCREMENT))''';

  static const String _createTableUsers = '''CREATE TABLE "$tableUser" (
        "id"	INTEGER,
        "login"	TEXT NOT NULL UNIQUE,
        "password"	TEXT NOT NULL,
        "id_role"	INTEGER,
        FOREIGN KEY("id_role") REFERENCES "$tableRole"("id") ON DELETE CASCADE,
        PRIMARY KEY("id" AUTOINCREMENT) )''';
  static const String _createTableBankData = '''CREATE TABLE "$tableBankData" (
        "id"	INTEGER PRIMARY KEY,
        "CardNumber"	TEXT NOT NULL CHECK (length(CardNumber) = 16) ,
        "CardExp" DATE NOT NULL,
        "CardCVC" TEXT NOT NULL CHECK (length(CardCVC) = 3) ,
        FOREIGN KEY("id") REFERENCES "$tableUser"("id") ON DELETE CASCADE,
        ''';

  static const String _createTablePersonalData =
      '''CREATE TABLE "$tablePersonalData" (
        "id"	INTEGER PRIMARY KEY,
        "Name"	TEXT NOT NULL,
        "LName" TEXT NOT NULL,
        "Patronymic" TEXT NULL,
        FOREIGN KEY("id") REFERENCES "$tableUser"("id") ON DELETE CASCADE,
        ''';

  static const String _createTableCategory = '''CREATE TABLE "$tableCategory" (
        "Name"	TEXT NOT NULL UNIQUE,
        PRIMARY KEY("Name") )''';

  static const String _createTableProducts = '''CREATE TABLE "$tableProducts" (
        "id"	INTEGER,
        "Name"	TEXT NOT NULL UNIQUE,
        "Description"	TEXT NOT NULL,
        "Category_Name"	TEXT NOT NULL,
        "Price" DECIMAL NOT NULL,
        FOREIGN KEY("Category_Name") REFERENCES "$tableCategory"("Name") ON DELETE CASCADE,
        PRIMARY KEY("id" AUTOINCREMENT) )''';
  static const String _createTableCart = '''CREATE TABLE "$tableCart" (
        "id"	INTEGER,
        "User_ID"	int NOT NULL,
        "Status_Name" TEXT NOT NULL,
        FOREIGN KEY("Status_Name") REFERENCES "$tableCartStatus"("Name") ON DELETE CASCADE,
        PRIMARY KEY("id" AUTOINCREMENT) )''';

  static const String _createTableCartStatus =
      '''CREATE TABLE "$tableCartStatus" (
        "Name"	TEXT NOT NULL UNIQUE,
        PRIMARY KEY("Name") )''';

  static const String _createTableCartItem = '''CREATE TABLE "$tableCartItem" (
        "id"	INTEGER,
        "Cart_ID"	int NOT NULL,
        "Product_ID" int NOT NULL,
        "Product_Amount" int NOT NULL,
        FOREIGN KEY("Cart_ID") REFERENCES "$tableCart"("id") ON DELETE CASCADE,
        FOREIGN KEY("Product_ID") REFERENCES "$tableProducts"("id") ON DELETE CASCADE,
        PRIMARY KEY("id" AUTOINCREMENT) )''';
}
