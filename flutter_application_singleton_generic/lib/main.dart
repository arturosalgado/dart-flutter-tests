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

  void _addUser() {
    setState(() {
      _user = User("user1", "John Doe");
      _repository.add(_user!.id, _user!);
    });
  }

  void _updateUser() {
    if (_user != null) {
      setState(() {
        _updater.updateUser(_user!.id, "Jane Doe");
        // Refresh _user to show updated value
        _user = _repository.getById(_user!.id) as User?;
      });
    }
  }

  void _addBlob() {
    setState(() {
      _blob = Blob("blob1", "Initial content");
      _repository.add(_blob!.id, _blob!);
    });
  }

  void _updateBlob() {
    if (_blob != null) {
      setState(() {
        _updater.updateBlob(_blob!.id, "Updated content");
        // Refresh _blob to show updated value
        _blob = _repository.getById(_blob!.id) as Blob?;
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
              onPressed: _addUser,
              child: Text('Add User'),
            ),
            ElevatedButton(
              onPressed: _updateUser,
              child: Text('Update User'),
            ),
            Text('User: ${_user?.toString() ?? "Not added"}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addBlob,
              child: Text('Add Blob'),
            ),
            ElevatedButton(
              onPressed: _updateBlob,
              child: Text('Update Blob'),
            ),
            Text('Blob: ${_blob?.toString() ?? "Not added"}'),
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

  void add(String id, dynamic object) {
    if (_identityMap.containsKey(id)) {
      throw Exception('ID already exists');
    }
    _identityMap[id] = object;
  }

  dynamic getById(String id) {
    return _identityMap[id];
  }
}

class Updater {
  final Repository _repository = Repository();

  void updateUser(String userId, String newName) {
    dynamic obj = _repository.getById(userId);
    if (obj is User) {
      obj.name = newName;
    }
  }

  void updateBlob(String blobId, String newContent) {
    dynamic obj = _repository.getById(blobId);
    if (obj is Blob) {
      obj.content = newContent;
    }
  }
}
