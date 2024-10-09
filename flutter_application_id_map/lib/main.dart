import 'package:flutter/material.dart';
import 'package:flutter_application_id_map/repository.dart';
import 'package:flutter_application_id_map/updater.dart';
import 'package:flutter_application_id_map/user.dart';

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
  User? _user1;
  User? _user2;

  void _createUser() {
    setState(() {
      _user1 = _userRepository.createUser("John Doe");
      _user2 = _userRepository.getUserById(_user1!.id);
    });
  }

  void _updateUser() {
    if (_user2 != null) {
      setState(() {
        _user2!.name = "Jane Doe";
      });
    }
  }

  void _updateUserApart() {
    User? user3 =  _userRepository.getUserById(_user1!.id);
    Updater().update(user3.id, newValue)
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
            ElevatedButton(
              onPressed: _updateUserApart,
              child: Text('Update User Apart'),
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
