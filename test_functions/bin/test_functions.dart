DatabaseLibrary databaseLibrary = DatabaseLibrary();
void main(List<String> arguments) async {
  List<Test> tests = [
    Test('sender:user', TestType.dynamicState),
    Test('sender:refresh', TestType.dynamicState),
    Test('tbl:vnd', TestType.dynamicState),
    Test('value:1', TestType.getList),
  ];

  for (var test in tests) {
    switch (test.type) {
      case TestType.dynamicState:
        print("i am running dynamicState");
        Map<String, dynamic> result =
            await databaseLibrary.dynamicState(test.payload);
        test.doTest(result);
        print(result);
        break;
      case TestType.getList:
        print("i am running getList");
        Map<String, dynamic> result =
            await databaseLibrary.getList(test.payload);
        test.doTest(result);
        print(result);
        break;
    }
  }
}

enum TestType { dynamicState, getList }

class Test {
  String payload;

  TestType type = TestType.dynamicState;
  Test(this.payload, this.type);

  void doTest(Map<String, dynamic> result) {
    Assert.isMap(result);
  }
}

Future<void> test1() async {
  var result = await databaseLibrary.dynamicState('test1');
}

Future<void> test2() async {
  var result2 = await databaseLibrary.dynamicState('test2');
}

Future<void> test3() async {
  var result3 = await databaseLibrary.getList('testList');
}

class DatabaseLibrary {
  Future<Map<String, dynamic>> dynamicState(String payload) async {
    return {
      'payload': payload,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
  }

  Future<Map<String, dynamic>> getList(String payload) async {
    return {
      'payload': payload,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
  }
}

class Assert {
  static void isMap(dynamic value) {
    if (value is Map) {
      throw Exception('Value is not a Map');
    }
  }
}
