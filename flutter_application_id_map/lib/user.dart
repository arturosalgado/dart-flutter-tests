class User {
  final int id;
  String name;

  User(this.id, this.name);

  @override
  String toString() => 'User(id: $id, name: $name)';
}
