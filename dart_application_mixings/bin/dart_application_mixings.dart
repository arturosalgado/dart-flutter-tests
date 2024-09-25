import 'package:dart_application_mixings/comment.dart';
import 'package:dart_application_mixings/data_converter.dart';
import 'package:dart_application_mixings/realtime_base.dart';
import 'package:dart_application_mixings/user.dart';
void main(List<String> arguments) async {
  
  Map<String,dynamic> userMap = {
    'userName':"Jose Arturo",
    RealtimeBase.CREATION_USERNAME_COLUMN:"pepe"
  };


   print("incoming map $userMap");
  
   User u = User();
   u.fromStoreMap(userMap);
   print(u.toJsonMap());
  // print("final user is $u");
  // print(u.toJsonMap());
  Map<String,dynamic> commentMap = {
      'comment':"Priviet ddd",
      RealtimeBase.CREATION_USER_FULL_NAME_COLUMN:"Pinche Full Artur",
      RealtimeBase.CREATION_USERNAME_COLUMN:"El Pepe JOs",
  };
  print("firs tmap $commentMap");
  Comment comment = Comment();
  comment.fromStoreMap(commentMap);
  print(comment.toJsonMap());
  print("toStore");
  print(comment.toStoreMap());

  // Blob blob = Blob();
  // await blob.fromJsonMap(
  //   {
  //     'content':"ffff"
  //   }
  // );

  // print(blob.toJsonMap());
}






class Blob extends DataConverter {
  String content = 'asdf';

  @override
  Map<String, dynamic> toJsonMapChild() {
    return {'content': content};
  }

  @override
  Future<void> fromJsonMapChild(Map<String,dynamic> map) async{

    content = map['content'];

  }

    @override
  void fromStoreMapChild(Map? map) {
      content = map!["content"];

  }
  
  @override
  Map<String, dynamic> toStoreMapChild() {
    return {
      'content':"ddddsasdf"
    };
  }
}




