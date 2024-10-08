mixin Identifiable {
  late String syncGuid;
  static Map<String, dynamic> identityMap = {};

  dynamic getById(String id) {
    return identityMap[id];
  }

  static void keep(String id, dynamic object) {
    identityMap[id] = object;
  }
}
