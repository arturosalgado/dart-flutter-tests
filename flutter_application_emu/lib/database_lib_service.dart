import 'dart:math';

import 'package:flutter_application_emu/blob_metadata_data.dart';
import 'package:flutter_application_emu/db_data_converter.dart';
import 'package:flutter_application_emu/content_updater.dart';
import 'package:flutter_application_emu/operations.dart';
import 'package:flutter_application_emu/user_data.dart';

class Databaselibservice {
  Future<Map<String, dynamic>> getDynamicState(
      Map<String, dynamic> payload) async {
    switch (payload['type']) {
      case 'user':
        return await payload['action'] == 'create'
            ? createUser(payload)
            : updateUser(payload);
      case 'blob':
        return await payload['action'] == 'create'
            ? createBlob(payload)
            : updateBlob(payload);
    }

    return {'action': 'nothing done'};
  }

  Future<Map<String, dynamic>> createUser(Map<String, dynamic> payload) async {
    UserData user;
    var rng = Random();
    var code = rng.nextInt(900) + 1000;

    user = UserData();
    user.syncGuid = code.toString();
    user.email = "a$code@a.com";
    user.username = "a$code";
    user.store.save(Operations.save);

    return {
      "status": 'ok',
      'object': user,
      'type': user.runtimeType.toString(),
      'action': 'refresh'
    };
  }

  Future<Map<String, dynamic>> createBlob(Map<String, dynamic> payload) async {
    UserData user;
    var rng = Random();
    var code = rng.nextInt(900) + 1000;

    user = UserData();
    user.syncGuid = code.toString();
    user.email = "a$code@a.com";
    user.username = "a$code";
    user.store.save(Operations.save);

    return {
      "status": 'ok',
      'object': user,
      'type': user.runtimeType.toString(),
      'action': 'refresh'
    };
  }

  Future<Map<String, dynamic>> updateUser(Map<String, dynamic> payload) async {
    UserData? user;
    user = await DbDataConverter.findById<UserData>(payload['syncGuid']);

    if (user != null) {
      // se actualiza en otra parte mandando el guid
      ContentUpdater.updateUser(user.syncGuid, payload['email']);
      // este usuario ya tiene el nuevo correo
      print("User updated is [$user] ");
    } else {
      print("user not found ");
    }
    return {
      "status": 'ok',
      'object': user,
      'type': user.runtimeType.toString(),
      'action': 'refresh'
    };
  }

  Future<Map<String, dynamic>> updateBlob(Map<String, dynamic> payload) async {
    BlobMetadataData? blob;
    blob =
        await DbDataConverter.findById<BlobMetadataData>(payload['syncGuid']);
    if (blob != null) {
      ContentUpdater.updateBlob(blob.syncGuid, payload['content']);
      print("Blob after  update in separete Class is [$blob] ");
    } else {
      print("blob not found ");
    }

    return {
      "status": 'ok',
      'object': blob,
      'type': blob.runtimeType.toString(),
      'action': 'refresh'
    };
  }
}
