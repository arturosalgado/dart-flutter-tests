import 'package:flutter_application_emu/db_data_converter.dart';
import 'package:flutter_application_emu/operations.dart';
import 'package:flutter_application_emu/user_data.dart';

class EmailUpdater {
  Future<void> update(String syncGuid, String newEmail) async {
    UserData? user = await DbDataConverter.findById(syncGuid);
    if (user != null) {
      user.email = newEmail;
      user.store.save(Operations.update);
    }
  }
}
