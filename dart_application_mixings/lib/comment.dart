
import 'package:dart_application_mixings/auditable.dart';
import 'package:dart_application_mixings/auditable_extendend.dart';
import 'package:dart_application_mixings/data_converter.dart';


class Comment extends DataConverter with Auditable, AuditableExtended{
  String comment = "all good ";
@override
  Future<void> fromJsonMapChild(Map<String,dynamic> map) async{

    comment = map['comment'];

  }
  @override
  Map<String, dynamic> toJsonMapChild() {
    Map<String, dynamic> fields = {'comment': comment};

  return fields;
  }
    @override
  void fromStoreMapChild(Map? map) {
      comment = map!["comment"];

  }
  
  @override
  Map<String, dynamic> toStoreMapChild() {
    return {
      'comment':"Priviete World"
    };
  }
}