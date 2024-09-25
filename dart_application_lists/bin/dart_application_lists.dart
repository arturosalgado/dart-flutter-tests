import 'package:dart_application_lists/dart_application_lists.dart' as dart_application_lists;

void main(List<String> arguments) {
  
  List<Map<String,dynamic>> list =
   [{"groups":["f1","f2"]},{"groups":["f2","f3"]},{"groups":["f3","f1"]}];


 List<Map<String,dynamic>> list2 =
   [{"games":["f1","f2"]},{"games":["f2","f3"]},{"games":["f3","f1"]}];
   

   var result = list.applyFilter(["f4"]);

  print(result);
 var result2 = list2.applyFilter(["f3"]);
   
  print(result2);


}