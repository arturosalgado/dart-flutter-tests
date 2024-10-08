import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_emu/dynamic_state.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  void onPressUpdate() {
    Map<String, dynamic> payload = {
      'action': 'update',
      'syncGuid': "456",
      'email': 'art@gmail.com'
    };
    DynamicState().getDynamicStateFromDatabaseLibrary(payload);
  }

  void onPressedCreateUser() {
    String id = generateRandomString();
    Map<String, dynamic> payload = {
      'action': 'create',
      'syncGuid': id,
      'email': 'art$id@gmail.com'
    };
    DynamicState().getDynamicStateFromDatabaseLibrary(payload);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    TextField textField = TextField(controller: textController);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textField,
              ElevatedButton(
                  onPressed: onPressUpdate,
                  child: const Text('Change Email for user 456')),
              ElevatedButton(
                  onPressed: onPressedCreateUser,
                  child: const Text('Create User'))
            ],
          ),
        ),
      ),
    );
  }

  String generateRandomString() {
    final random = Random();
    return (1000 + random.nextInt(9000)).toString();
  }
}
