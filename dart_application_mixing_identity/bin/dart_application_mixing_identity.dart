void main(List<String> arguments) {
  User user = User('1', 'John Doe', 30);
  print("first user $user");

  User user2 = IdentityMap.find('1');
  print("user2 $user2");
  user.age = 50;

  User user3 = IdentityMap.find('1');
  print("user3 $user3");

  Group group = Group('100', 'Dart', [user]);
  print("group $group");

  group.users[0].name = 'Jane Doe';

  Group anotherInstance = IdentityMap.find('100');
  print("anotherInstance $anotherInstance");

  anotherInstance.users[0].name = 'Jane Joplin Doe';

  print("firs group $group");

  BlobMetadataData blob = BlobMetadataData('1000', 'content');
  print("blob $blob");
  TagUpdater().updateTags(['1000'], ['tag1', 'tag2']);
  print("blob should be updated $blob");

  BlobMetadataData anotherBlob = IdentityMap.find('1000');
  print("anotherBlob $anotherBlob");
}

mixin IdentityMap {
  static final Map<String, dynamic> _identityMap = {};

  void setIdentity(String key, dynamic value) {
    _identityMap[key] = value;
  }

  dynamic getIdentity(String key) {
    return _identityMap[key];
  }

  void removeIdentity(String key) {
    _identityMap.remove(key);
  }

  void clearIdentity() {
    _identityMap.clear();
  }

  void printIdentity() {
    print(_identityMap);
  }

  static dynamic find(String id) {
    return _identityMap[id];
  }
}

class TagUpdater with IdentityMap {
  updateTags(List<String> ids, List<String> tags) {
    for (String id in ids) {
      dynamic data = IdentityMap.find(id);
      if (data is BlobMetadataData) {
        data.updateTags(tags);
      }
    }
  }
}

class User with IdentityMap {
  String id;
  String name;
  int age;

  User(this.id, this.name, this.age) {
    setIdentity(id, this);
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, age: $age}';
  }
}

class Group with IdentityMap {
  String id;
  String name;
  List<User> users;

  Group(this.id, this.name, this.users) {
    setIdentity(id, this);
  }

  @override
  String toString() {
    return 'Group{id: $id, name: $name, users: $users}';
  }
}

abstract class DataConverter with IdentityMap {}

class BlobMetadataData extends DataConverter {
  List<String> tags;
  String id;
  String content;
  BlobMetadataData(this.id, this.content, {this.tags = const []}) {
    setIdentity(id, this);
  }

  void updateTags(List<String> tags) {
    this.tags = tags;
  }

  @override
  String toString() {
    return 'BlobMetadataData{ id:$id, content:$content tags: $tags}';
  }
}
