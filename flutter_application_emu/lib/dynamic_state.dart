import 'package:flutter_application_emu/database_lib_service.dart';

class DynamicState {
  Future<Map<String, dynamic>> getDynamicStateFromDatabaseLibrary(
      Map<String, dynamic> payload) async {
    return Databaselibservice().getDynamicState(payload);
  }
}
