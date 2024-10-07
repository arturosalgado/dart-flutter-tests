import 'package:dart_application_mixins/dart_application_mixins.dart'
    as dart_application_mixins;

void main(List<String> arguments) {
  print('Hello world: ${dart_application_mixins.calculate()}!');
  var animal1 = Animal();
  animal1.eat();
  animal1.fly();
  animal1.flyFaster();
  String landing = Flyable.landing();
  print(landing);
  //print(Animal.landing());
}

class Animal with Flyable {
  void eat() {
    print('I am eating');
  }
}

mixin Flyable {
  void fly() {
    print('I am flying');
  }

  static String landing() {
    print('I am landing');
    return "Landing now";
  }

  void flyFaster() {
    print('I am flying faster');
  }
}
