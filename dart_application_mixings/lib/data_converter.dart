
import 'package:dart_application_mixings/auditable.dart';

abstract class DataConverter {

  
  Map<String, dynamic> toJsonMap() {
    Map<String, dynamic> map = toJsonMapChild();

    if (this is Auditable) 
    {
      Auditable auditable = this as Auditable;
      //by inheratence, if this is Extended, AuditableExtended will add the parent and child properties 
      Map<String,dynamic>  auditableFields = auditable.getAuditableFields();
      map.addAll(auditableFields);
    }
    return map;
  }

  Map<String, dynamic> toJsonMapChild() {
    throw UnimplementedError('DataConverter.toJsonMapChild');
  }
  Future<void> fromJsonMapChild(Map<String, dynamic> map);

  Future<void> fromJsonMap(Map<String, dynamic> map) async {

    await fromJsonMapChild(map);// await is correct @check
    if (this is Auditable){
      Auditable auditable = this as Auditable;
      auditable.fromJsonMapAudit(map);
    }
    
  }
  void fromStoreMapChild(Map? map);

  void fromStoreMap(Map? map) {
    if (!fromStoreMapValidate(map)) {
      return;
    }
    fromStoreMapChild(map);
    if (this is Auditable){
      Auditable auditable = this as Auditable;
      auditable.fromStoreMapAudit(map);
    }
   
  }
   bool fromStoreMapValidate(Map? map) {
    if (map == null) {
      //setError('Object not found in database');
      return false;
    }

    return true;
  }
  Map<String, dynamic> toStoreMapChild();

  Map<String, dynamic> toStoreMap() {
    Map<String, dynamic> map = toStoreMapChild();

    if (this is Auditable){
      Auditable auditable = this as Auditable;
      //auditable.toStoreMapAuditable();
      map.addAll(auditable.toStoreMapAuditable());
    }

    return map;
  }

   List<dynamic> getMergeArguments() {
    List<dynamic> audit = [];
    List<dynamic> extendedAudit = [];
    List<dynamic> childArguments = getMergeArgumentsChild();

    if (this is! Auditable) {
      return childArguments;
    }

    if (this is Auditable) {
      audit = (this as Auditable).getArgumentsAuditable();
    }
    
    return [...childArguments, ...audit];
    
  }

  List<dynamic> getMergeArgumentsChild() {
    throw UnimplementedError('DataConverter.getMergeArguments');
  }

}