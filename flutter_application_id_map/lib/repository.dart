import 'package:flutter_application_id_map/main.dart';
import 'package:flutter_application_id_map/user.dart';

class UserRepository {
  final Map<int, User> _identityMap = {};
  int _nextId = 1;

  User createUser(String name) {
    final user = User(_nextId++, name);
    _identityMap[user.id] = user;
    return user;
  }

  User? getUserById(int id) {
    return _identityMap[id];
  }
}
