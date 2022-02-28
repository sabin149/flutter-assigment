import '../database/post_database.dart';

class DatabaseInstance {
  static DatabaseInstance? _instance;

  DatabaseInstance._();
  static DatabaseInstance get instance => _instance ??= DatabaseInstance._();

  Future<AppDatabase> getDatabaseInstance() {
    return $FloorAppDatabase.databaseBuilder('post_database.db').build();
  }
}
