void main(List<String> arguments) {
  String test = "1321,smith";
  final parts = test.split(',');

  if (parts.length == 1) {
    print(parts[0]);
  }
  if (parts.length == 2) {
    print(parts[0]);
    print(parts[1]);
  }
}

abstract class ParentClass {
  void doAction(String mobile, int web);
}

class ChildMobile extends ParentClass {
  @override
  void doAction(String mobile, int web) {
    print("doing mobile $mobile");
  }
}

class ChildWeb extends ParentClass {
  @override
  void doAction(String mobile, int web) {
    print("doing web only with $web");
  }
}
