class Databaselibservice {
  Map<String, dynamic> getDynamicState(Map<String, dynamic> payload) {
    print("pay $payload");
    String syncGuid = payload['syncGuid'];
    print(" blob id is $syncGuid ");
    return {'state': 'updated'};
  }
}
