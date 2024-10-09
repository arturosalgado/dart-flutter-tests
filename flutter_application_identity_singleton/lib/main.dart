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
  final UserRepository _userRepository = UserRepository();
  final Updater _updater = Updater();
  User? _user1;
  User? _user2;

  void _createUser() {
    setState(() {
      _user1 = _userRepository.createUser("John Doe");
      _user2 = _userRepository.getUserById(_user1!.id);
    });
  }

  void _updateUser() {
    if (_user1 != null) {
      setState(() {
        _updater.update(_user1!.id, "Jane Doe");
        // Refresh _user1 and _user2 to show updated values
        //_user1 = _userRepository.getUserById(_user1!.id);
        //_user2 = _userRepository.getUserById(_user1!.id);
        print(_user1);
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateUser,
              child: Text('Update User'),
            ),
            SizedBox(height: 20),
            Text('User 1: ${_user1?.toString() ?? "Not created"}'),
            Text('User 2: ${_user2?.toString() ?? "Not created"}'),
          ],
        ),
      ),
    );
  }
}

class User {
  final int id;
  String name;

  User(this.id, this.name);

  @override
  String toString() => 'User(id: $id, name: $name)';
}

class UserRepository {
  static final UserRepository _instance = UserRepository._internal();
  factory UserRepository() => _instance;
  UserRepository._internal();

  final Map<int, User> _identityMap = {};
  int _nextId = 1;

  User createUser(String name) {
    final user = User(_nextId++, name);
    _identityMap[user.id] = user;
    return user;
  }

  User? getUserById(int id) {
    return _identityMap[id];
  }
}

class Updater {
  final UserRepository _userRepository = UserRepository();

  void update(int userId, String newValue) {
    User? user = _userRepository.getUserById(userId);
    if (user != null) {
      user.name = newValue;
    }
  }
}
