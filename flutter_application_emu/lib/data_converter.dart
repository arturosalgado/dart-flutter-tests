import 'package:flutter_application_emu/identifiable.dart';
import 'package:flutter_application_emu/store.dart';

abstract class DataConverter {
  String? syncGuid;
  late Store store;

  DataConverter() {
    store = Store(this);
  }

  void fromStoreMapChild(Map<String, dynamic> map);

  void fromStoreMap(Map<String, dynamic> map) {
    fromStoreMapChild(map);
  }

  Map<String, dynamic> toStoreMapChild();

  Map<String, dynamic> toStoreMap() {
    return toStoreMapChild();
  }
}
