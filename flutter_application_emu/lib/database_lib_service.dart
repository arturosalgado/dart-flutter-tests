import 'dart:math';

import 'package:flutter_application_emu/db_data_converter.dart';
import 'package:flutter_application_emu/email_updater.dart';
import 'package:flutter_application_emu/operations.dart';
import 'package:flutter_application_emu/user_data.dart';

class Databaselibservice {
  Future<Map<String, dynamic>> getDynamicState(
      Map<String, dynamic> payload) async {
    print("requested action ${payload['action']} ");
    late UserData? user;
    if (payload['action'] == 'create') {
      var rng = Random();
      var code = rng.nextInt(900) + 1000;

      user = UserData();
      user.syncGuid = code.toString();
      user.email = "a$code@a.com";
      user.username = "a$code";
      user.store.save(Operations.save);
    } else if (payload['action'] == 'update') {
      if (payload['type'] = 'user') {
        return updateUser(payload);
      } else if (payload['type'] == 'blob') {
        return updateBlob(payload);
      }
    }
  }

  Future<void> updateUser(Map<String, dynamic> payload) async {
    UserData? user;
    user = await DbDataConverter.findById<UserData>(payload['syncGuid']);
    if (user != null) {
      user.email = payload['email'];
      EmailUpdater().update(user.syncGuid, payload['email']);
      print("User updated is [$user] ");
    } else {
      print("user not found ");
    }
  }
}
