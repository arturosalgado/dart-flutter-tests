import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IdentityMap Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'IdentityMap Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Repository _repository = Repository();
  final Updater _updater = Updater();
  User? _user;
  Blob? _blob;

  void _createUser() {
    setState(() {
      _user = _repository.createUser("user1", "John Doe");
    });
  }

  void _updateUser() {
    if (_user != null) {
      setState(() {
        _updater.updateUser(_user!.id, "Jane Doe");
        // Refresh _user to show updated value
        _user = _repository.getUserById(_user!.id);
      });
    }
  }

  void _createBlob() {
    setState(() {
      _blob = _repository.createBlob("blob1", "Initial content");
    });
  }

  void _updateBlob() {
    if (_blob != null) {
      setState(() {
        _updater.updateBlob(_blob!.id, "Updated content");
        // Refresh _blob to show updated value
        _blob = _repository.getBlobById(_blob!.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _createUser,
              child: Text('Create User'),
            ),
            ElevatedButton(
              onPressed: _updateUser,
              child: Text('Update User'),
            ),
            Text('User: ${_user?.toString() ?? "Not created"}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createBlob,
              child: Text('Create Blob'),
            ),
            ElevatedButton(
              onPressed: _updateBlob,
              child: Text('Update Blob'),
            ),
            Text('Blob: ${_blob?.toString() ?? "Not created"}'),
          ],
        ),
      ),
    );
  }
}

class User {
  final String id;
  String name;

  User(this.id, this.name);

  @override
  String toString() => 'User(id: $id, name: $name)';
}

class Blob {
  final String id;
  String content;

  Blob(this.id, this.content);

  @override
  String toString() => 'Blob(id: $id, content: $content)';
}

class Repository {
  static final Repository _instance = Repository._internal();
  factory Repository() => _instance;
  Repository._internal();

  final Map<String, dynamic> _identityMap = {};

  User createUser(String id, String name) {
    if (_identityMap.containsKey(id)) {
      throw Exception('ID already exists');
    }
    final user = User(id, name);
    _identityMap[id] = user;
    return user;
  }

  Blob createBlob(String id, String content) {
    if (_identityMap.containsKey(id)) {
      throw Exception('ID already exists');
    }
    final blob = Blob(id, content);
    _identityMap[id] = blob;
    return blob;
  }

  User? getUserById(String id) {
    final obj = _identityMap[id];
    return (obj is User) ? obj : null;
  }

  Blob? getBlobById(String id) {
    final obj = _identityMap[id];
    return (obj is Blob) ? obj : null;
  }
}

class Updater {
  final Repository _repository = Repository();

  void updateUser(String userId, String newName) {
    User? user = _repository.getUserById(userId);
    if (user != null) {
      user.name = newName;
    }
  }

  void updateBlob(String blobId, String newContent) {
    Blob? blob = _repository.getBlobById(blobId);
    if (blob != null) {
      blob.content = newContent;
    }
  }
}
