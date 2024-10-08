import 'package:flutter_application_emu/blob_metadata_data.dart';
import 'package:flutter_application_emu/db_data_converter.dart';
import 'package:flutter_application_emu/operations.dart';
import 'package:flutter_application_emu/user_data.dart';

class ContentUpdater {
  static Future<void> updateUser(String syncGuid, String newEmail) async {
    UserData? user = await DbDataConverter.findById(syncGuid);
    if (user != null) {
      user.email = newEmail;
      user.store.save(Operations.update);
    }
  }

  static Future<void> updateBlob(String syncGuid, String newContent) async {
    BlobMetadataData? blob = await DbDataConverter.findById(syncGuid);
    if (blob != null) {
      blob.content = newContent;
      blob.store.save(Operations.update);
    }
  }
}
