import 'package:dart_application_reference/dart_application_reference.dart'
    as dart_application_reference;

void main(List<String> arguments) async {
  UserData a = UserData('1', "pepe");
  print("before $a ");
  await ContentUpdater().updateUser('1', "jose");
  print("after $a");

  UserData user2 = UserData('2', 'ARturo');
  print('just created user2 $user2');
  await ContentUpdater().updateUser('2', 'Que onda');
  print("user2 again $user2");
}

class UserData with Identifiable {
  String? id;
  String? name;
  UserData(this.id, this.name) {
    add(id!, this);
  }
  @override
  String toString() {
    return 'user data {id $id, name $name}';
  }
}

mixin Identifiable {
  static Map<String, dynamic> identityMap = {};

  void add(String id, dynamic myObject) {
    print('registering id $id of type ${myObject.runtimeType}');
    identityMap[id] = myObject;
    print("contents of identityMap $identityMap");
  }

  dynamic find(String id) {
    return identityMap[id];
  }
}

class ContentUpdater with Identifiable {
  Future<void> updateUser(String id, String newName) async {
    print("received $id");
    UserData object = find(id);
    print("foind $object");

    object.name = newName;
    print("updated $object");
  }
}
