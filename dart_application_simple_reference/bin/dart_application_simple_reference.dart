import 'package:dart_application_simple_reference/dart_application_simple_reference.dart'
    as dart_application_simple_reference;

void main(List<String> arguments) {
  User a = User();
  a.setId('1');
  a.setName('test');
  print(a);
  Identifiable.map[a.id] = a;

  User b = Identifiable.map['1'];

  b.name = "b changed it";
  print(a);
  print(b);
}

class User {
  String? name;
  String? id;

  void setName(String newName) {
    this.name = newName;
  }

  void setId(id) {
    this.id = id;
  }

  @override
  String toString() {
    return 'User [$name] $hashCode';
  }
}

mixin Identifiable {
  static Map<String?, dynamic> map = {};
}
