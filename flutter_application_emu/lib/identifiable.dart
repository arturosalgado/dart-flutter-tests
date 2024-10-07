mixin Identifiable {
  static Map<String, dynamic> identityMap = {};

  dynamic getById(String id) {
    return identityMap[id];
  }

  void keep(String id, dynamic object) {
    identityMap[id] = object;
  }
}
