class IdentityMap {
  final Map<String, dynamic> _objectsById = {};

  void addObject(String id, dynamic object) {
    _objectsById[id] = object;
  }

  dynamic getObjectById(String id) {
    return _objectsById[id];
  }

  void updateAttribute(String id, String attributeName, dynamic newValue) {
    dynamic object = _objectsById[id];
    if (object != null) {
      object.updateAttribute(attributeName, newValue);
    }
  }

  @override
  String toString() {
    return _objectsById.toString();
  }
}

mixin Identifiable {
  static var identityMap = IdentityMap();

  static dynamic find(String id) {
    return identityMap.getObjectById(id);
  }
}

class User with Identifiable {
  final String id;
  String name;
  int age;

  User(this.id, this.name, this.age) {
    Identifiable.addObject(id, this);
  }

  void updateAttribute(String attributeName, dynamic newValue) {
    switch (attributeName) {
      case 'name':
        name = newValue;
        break;
      case 'age':
        age = newValue;
        break;
    }
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'age': age};
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

void main() {
  var user1 = User('1', 'Alice', 30);
  var user2 = User('2', 'Bob', 30);
  var user3 = User('3', 'Charlie', 35);

  print(user1.identityMap);
  var userClone = User.find('1');
}
