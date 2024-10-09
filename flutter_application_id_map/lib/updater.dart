import 'package:flutter_application_id_map/user.dart';

class Updater {
  void update(int userId, String newValue) {

     User? user4 =  _userRepository.getUserById(1);
     user4.name = newValue;

  }
}
