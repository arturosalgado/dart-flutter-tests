import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_emu/dynamic_state.dart';
import 'package:flutter_application_emu/types.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final TextEditingController textControllerId = TextEditingController();
  final TextEditingController textControllerContent = TextEditingController();
  void onPressUpdate() {
    Map<String, dynamic> payload = {
      'action': 'update',
      'type': Types.user,
      'syncGuid': textControllerId.text,
      'email': textControllerContent.text
    };
    DynamicState().getDynamicStateFromDatabaseLibrary(payload);
  }

  void onPressedCreateUser() {
    String id = generateRandomString();
    Map<String, dynamic> payload = {
      'action': 'create',
      'type': Types.user,
      'syncGuid': id,
      'email': 'art$id@gmail.com'
    };
    DynamicState().getDynamicStateFromDatabaseLibrary(payload);
  }

  void onPressedCreateBlob() {
    String id = generateRandomString2();
    Map<String, dynamic> payload = {
      'action': 'create',
      'type': Types.blob,
      'syncGuid': id,
      'content': "content:$id"
    };
    DynamicState().getDynamicStateFromDatabaseLibrary(payload);
  }

  void onPressUpdateBlob() {
    Map<String, dynamic> payload = {
      'action': 'update',
      'type': Types.blob,
      'syncGuid': textControllerId.text,
      'content': textControllerContent.text
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
      controller: textControllerContent,
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
                  onPressed: onPressedCreateUser,
                  child: const Text('Create User')),
              ElevatedButton(
                  onPressed: onPressUpdate, child: const Text('Update User')),
              ElevatedButton(
                  onPressed: onPressedCreateBlob,
                  child: const Text('Create Blob')),
              ElevatedButton(
                  onPressed: onPressUpdateBlob,
                  child: const Text('Update Blob')),
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

  String generateRandomString2() {
    final random = Random();
    return (100 + random.nextInt(900)).toString();
  }
}
