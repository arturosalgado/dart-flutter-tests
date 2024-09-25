// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Test {
  String method = '';
  List<dynamic>? positionalArgs;
  Map<Symbol, dynamic>? named;
  Test(this.method, this.positionalArgs, [this.named]);
}

class MyClass {
  void method1(String arg1, [int? arg2]) {
    print('Method 1 called with $arg1${arg2 != null ? ' and $arg2' : ''}');
  }

  void method2(int arg1, {String? arg2}) {
    print('Method 2 called with $arg1${arg2 != null ? ' and $arg2' : ''}');
  }

  void call() {
    List<Test> methods = [
      Test('method1', ['hello']),
      Test('method1', ['world']),
      Test('method2', [5])
    ];

    for (Test t in methods) {
      invokeMethod(t.method, t.positionalArgs);
    }
  }

  dynamic invokeMethod(String methodName, List<dynamic>? positionalArgs,
      [Map<Symbol, dynamic>? namedArgs]) async {
    switch (methodName) {
      case 'method1':
        return Function.apply(method1, positionalArgs);
      case 'method2':
        return Function.apply(method2, positionalArgs, namedArgs);
      default:
        throw ArgumentError('Method $methodName not found');
    }
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MyClass myObject = MyClass();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flexible Dynamic Method Invocation')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Invoke Method 1 (1 arg)'),
                onPressed: () => myObject.call(),
                // onPressed: () => myObject.invokeMethod('method1', ['Hello']),
              ),
              ElevatedButton(
                child: Text('Invoke Method 1 (2 args)'),
                onPressed: () =>
                    myObject.invokeMethod('method1', ['Hello', 42]),
              ),
              ElevatedButton(
                child: Text('Invoke Method 2 (positional)'),
                onPressed: () => myObject.invokeMethod('method2', [42]),
              ),
              ElevatedButton(
                child: Text('Invoke Method 2 (named)'),
                onPressed: () => myObject
                    .invokeMethod('method2', [42], {Symbol('arg2'): 'World'}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
