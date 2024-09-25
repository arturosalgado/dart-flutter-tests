
import 'package:dart_application_mixings/auditable.dart';
import 'package:dart_application_mixings/data_converter.dart';
class User extends DataConverter with Auditable {

  static const String TABLE = 'users';
  static const String CREATE = 'CREATE TABLE {$TABLE} ${Auditable.AUDIT_CREATION}';
  String userName = "";

  @override
  Map<String, dynamic> toJsonMapChild() {
    Map<String, dynamic> fields = {'userName': userName};

    return fields;
}
@override
  Future<void> fromJsonMapChild(Map<String,dynamic> map) async{

    userName = map['userName'];

  }
  @override
  void fromStoreMapChild(Map? map) {
      userName = map!["userName"];

  }

  @override
  String toString() {
    
    return "use $userName creat user [$creationUsername]";
    
  }
  
  @override
  Map<String, dynamic> toStoreMapChild() {
    return{
      'userName':"Arturo AAA"
    };
  }
}