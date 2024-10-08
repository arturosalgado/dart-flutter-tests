import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_emu/dynamic_state.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final TextEditingController textControllerId = TextEditingController();
  final TextEditingController textControllerEmail = TextEditingController();
  void onPressUpdate() {
    Map<String, dynamic> payload = {
      'action': 'update',
      'syncGuid': textControllerId.text,
      'email': textControllerEmail.text
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
    TextField textFieldId = TextField(
      controller: textControllerId,
      decoration: const InputDecoration(hintText: 'SyncGuid'),
    );

    TextField textFieldEmail = TextField(
      controller: textControllerEmail,
      decoration: const InputDecoration(hintText: 'Email'),
    );

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textFieldId,
              textFieldEmail,
              ElevatedButton(
                  onPressed: onPressUpdate,
                  child: const Text('Change Email for user ')),
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
