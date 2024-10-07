import 'package:flutter/material.dart';
import 'package:flutter_application_emu/dynamic_state.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  void onPress() {
    Map<String, dynamic> payload = {'syncGuid': "55"};
    DynamicState().getDynamicStateFromDatabaseLibrary(payload);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(onPressed: onPress, child: Text('Change tags')),
        ),
      ),
    );
  }
}
