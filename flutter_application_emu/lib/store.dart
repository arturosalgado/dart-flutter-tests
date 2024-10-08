// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter_application_emu/data_converter.dart';
import 'package:flutter_application_emu/identifiable.dart';
import 'package:flutter_application_emu/operations.dart';

class Store {
  final DataConverter _dataConverter;
  late Map<String, dynamic> db = {
    '123': {'syncGuid': '123', 'content': 'An Image'},
    '456': {'syncGuid': '456', 'username': 'arturo', 'email': 'a@a.com'},
    '789': {'syncGuid': '789', 'username': 'Jose', 'email': 'j@j.com'}
  };
  Store(this._dataConverter);

  dynamic query(String id) {
    if (db.containsKey(id)) {
      return db[id];
    }
    throw Exception("Item not found in deb");
  }

  Future<void> save(Operations operation) async {
    // simulate save to db
    if (operation == Operations.save) {
      db.addAll({_dataConverter.syncGuid: _dataConverter.toStoreMap()});
      // after that, save to Identifiable
      Identifiable.keep(_dataConverter.syncGuid, _dataConverter);
    }

    print("Map contents " + Identifiable.identityMap.toString());
  }
}
