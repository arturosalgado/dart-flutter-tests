// ignore_for_file: constant_identifier_names
import 'package:dart_application_mixings/auditable.dart';
import 'package:dart_application_mixings/realtime_base.dart';

mixin AuditableExtended on Auditable {
  bool hasExtendedAudit = true;
  String? _creationUserFullName;
  String? _lastUpdateUserFullName;
  String? _deletionUserFullName;

  static const String AUDIT_EXTENDED_CREATION = '''
      ${RealtimeBase.CREATION_USER_FULL_NAME_COLUMN} TEXT  NULL,
      ${RealtimeBase.LAST_UPDATE_USER_FULL_NAME_COLUMN} TEXT NULL,
      ${RealtimeBase.DELETION_USER_FULL_NAME_COLUMN} TEXT NULL

  ''';
   static const String AUDIT_EXTENDED_INSERT = '''
      ${RealtimeBase.CREATION_USER_FULL_NAME_COLUMN},
      ${RealtimeBase.LAST_UPDATE_USER_FULL_NAME_COLUMN},
      ${RealtimeBase.DELETION_USER_FULL_NAME_COLUMN}
  ''';
  static const String AUDIT_EXTENDED_UPDATE = '''
  ${RealtimeBase.CREATION_USER_FULL_NAME_COLUMN} = excluded.${RealtimeBase.CREATION_USER_FULL_NAME_COLUMN},
  ${RealtimeBase.LAST_UPDATE_USER_FULL_NAME_COLUMN} = excluded.${RealtimeBase.LAST_UPDATE_USER_FULL_NAME_COLUMN},
  ${RealtimeBase.DELETION_USER_FULL_NAME_COLUMN} = excluded.${RealtimeBase.DELETION_USER_FULL_NAME_COLUMN}
 
  ''';
  
   set creationUserFullName(String? value) {
    _creationUserFullName = hasExtendedAudit ? value : null;
  }
   set lastUpdateUserFullName(String? value) {
    _lastUpdateUserFullName = hasExtendedAudit ? value : null;
  }
   set deletionUserFullName(String? value) {
    _deletionUserFullName = hasExtendedAudit ? value : null;
  } 
  String? get creationUserFullName {
    return hasExtendedAudit ? _creationUserFullName : null;
  }
  String? get lastUpdateUserFullName {
    return hasExtendedAudit ? _lastUpdateUserFullName : null;
  }
  String? get deletionUserFullName {
    return hasExtendedAudit ? _deletionUserFullName : null;
  }

  @override
  Map<String, dynamic> getAuditableFields() {
    Map<String,dynamic> parent = super.getAuditableFields();
      Map<String,dynamic> childExtended  = {
        RealtimeBase.CREATION_USER_FULL_NAME_JSON: creationUserFullName,
        RealtimeBase.LAST_UPDATE_USER_FULL_NAME_JSON: lastUpdateUserFullName,
        RealtimeBase.DELETION_USER_FULL_NAME_JSON:
            deletionStatus ? deletionUserFullName : null,
      };
    
    return {
      ...parent,
      ...childExtended
     
    };
    
    
  }
  @override
  void fromJsonMapAudit(Map<String, dynamic> map) {
    super.fromJsonMapAudit(map);
     creationUserFullName = map[RealtimeBase.CREATION_USER_FULL_NAME_JSON];
      lastUpdateUserFullName =
          map[RealtimeBase.LAST_UPDATE_USER_FULL_NAME_JSON];
      deletionUserFullName = deletionStatus
          ? map[RealtimeBase.DELETION_USER_FULL_NAME_JSON]
          : null;

  }

  @override
  void fromStoreMapAudit(Map? map) {
    
      super.fromStoreMapAudit(map);
      creationUserFullName = map![RealtimeBase.CREATION_USER_FULL_NAME_COLUMN];
      lastUpdateUserFullName =
          map[RealtimeBase.LAST_UPDATE_USER_FULL_NAME_COLUMN];
      deletionUserFullName = deletionStatus
          ? map[RealtimeBase.DELETION_USER_FULL_NAME_COLUMN]
          : null;
  }
  @override
   Map<String,dynamic> toStoreMapAuditable(){

      print("calling child");
      Map<String, dynamic> extended = {
        RealtimeBase.CREATION_USER_FULL_NAME_COLUMN: creationUserFullName,
        RealtimeBase.LAST_UPDATE_USER_FULL_NAME_COLUMN: lastUpdateUserFullName,
        RealtimeBase.DELETION_USER_FULL_NAME_COLUMN:
            deletionStatus ? deletionUserFullName : null,
      };

      return {
        ...super.toStoreMapAuditable(),
        ...extended
      };
    
   } 
  @override
    List<dynamic> getArgumentsAuditable(){
    
     return  [
        ...super.getArgumentsAuditable(),
        creationUserFullName,
        lastUpdateUserFullName,
        deletionUserFullName
      ];
    
  }
}