import 'package:flutter_application_emu/data_converter.dart';

class UserData extends DataConverter {
  late String? syncGuid;
  late String username;
  late String email;

  @override
  void fromStoreMapChild(Map<String, dynamic> map) {
    syncGuid = map['syncGuid'];
    username = map['username'];
    email = map['email'];
  }

  @override
  Map<String, dynamic> toStoreMapChild() {
    return {'syncGuid': syncGuid, 'username': username, 'email': email};
  }

  @override
  String toString() {
    return 'User: syncGuid $syncGuid, username: $username, email $email';
  }
}
