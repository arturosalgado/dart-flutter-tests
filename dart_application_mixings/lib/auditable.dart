// ignore_for_file: constant_identifier_names

import 'package:dart_application_mixings/realtime_base.dart';

mixin Auditable {


  static const String AUDIT_CREATION = '''
      ${RealtimeBase.CREATION_USERNAME_COLUMN} TEXT  NULL,
      ${RealtimeBase.CREATION_DATETIME_COLUMN} TEXT  NULL,
      ${RealtimeBase.LAST_UPDATE_USERNAME_COLUMN} TEXT  NULL,
      ${RealtimeBase.LAST_UPDATE_DATETIME_COLUMN} TEXT  NULL,
      ${RealtimeBase.DELETION_STATUS_COLUMN} INTEGER NULL, 
      ${RealtimeBase.DELETION_USERNAME_COLUMN} TEXT NULL,
      ${RealtimeBase.DELETION_DATETIME_COLUMN} TEXT NULL,
      ${RealtimeBase.UI_KEY_COLUMN} TEXT NULL
  ''';
 

  static const String AUDIT_INSERT = '''
      ${RealtimeBase.CREATION_USERNAME_COLUMN},
      ${RealtimeBase.CREATION_DATETIME_COLUMN},
      ${RealtimeBase.LAST_UPDATE_USERNAME_COLUMN},
      ${RealtimeBase.LAST_UPDATE_DATETIME_COLUMN},
      ${RealtimeBase.DELETION_STATUS_COLUMN},
      ${RealtimeBase.DELETION_USERNAME_COLUMN},
      ${RealtimeBase.DELETION_DATETIME_COLUMN},
      ${RealtimeBase.UI_KEY_COLUMN}
  ''';

 

  static const String AUDIT_UPDATE = '''
  ${RealtimeBase.CREATION_USERNAME_COLUMN} = excluded.${RealtimeBase.CREATION_USERNAME_COLUMN},
  ${RealtimeBase.CREATION_DATETIME_COLUMN} = excluded.${RealtimeBase.CREATION_DATETIME_COLUMN},
  ${RealtimeBase.LAST_UPDATE_USERNAME_COLUMN} = excluded.${RealtimeBase.LAST_UPDATE_USERNAME_COLUMN},
  ${RealtimeBase.LAST_UPDATE_DATETIME_COLUMN} = excluded.${RealtimeBase.LAST_UPDATE_DATETIME_COLUMN},
  ${RealtimeBase.DELETION_STATUS_COLUMN} = excluded.${RealtimeBase.DELETION_STATUS_COLUMN},
  ${RealtimeBase.DELETION_USERNAME_COLUMN} = excluded.${RealtimeBase.DELETION_USERNAME_COLUMN},
  ${RealtimeBase.DELETION_DATETIME_COLUMN} = excluded.${RealtimeBase.DELETION_DATETIME_COLUMN},
  ${RealtimeBase.UI_KEY_COLUMN} = excluded.${RealtimeBase.UI_KEY_COLUMN}
''';


 


  bool hasAudit = true;
  bool _deletionStatus = false;

  String? _creationUsername;
  DateTime? _creationDatetime;

  String? _lastUpdateUsername;
  DateTime? _lastUpdateDatetime;
 

  String? _deletionUsername;
  DateTime? _deletionDatetime;
  
  String? get creationUsername {
    return hasAudit ? _creationUsername : null;
  }
  DateTime? get creationDatetime {
    return hasAudit ? _creationDatetime : null;
  }

  String? get lastUpdateUsername {
    return hasAudit ? _lastUpdateUsername : null;
  }

  DateTime? get lastUpdateDatetime {
    return hasAudit ? _lastUpdateDatetime : null;
  }

  String? get deletionUsername {
    return hasAudit ? _deletionUsername : null;
  }

  DateTime? get deletionDatetime {
    return hasAudit ? _deletionDatetime : null;
  }

  String? uiKey;
   bool get deletionStatus {
    return _deletionStatus;
  }
  set deletionStatus(bool value) {
    _deletionStatus = hasAudit ? value : false;
  }

  set creationUsername(String? value) {
    _creationUsername = hasAudit ? value : null;
  }
  set creationDatetime(DateTime? value) {
    _creationDatetime = hasAudit ? value : null;
  }
  set lastUpdateUsername(String? value) {
    _lastUpdateUsername = hasAudit ? value : null;
  }
  set lastUpdateDatetime(DateTime? value) {
    _lastUpdateDatetime = hasAudit ? value : null;
  }
  set deletionUsername(String? value) {
    _deletionUsername = hasAudit ? value : null;
  }
  set deletionDatetime(DateTime? value) {
    _deletionDatetime = hasAudit ? value : null;
  }
  Map<String, dynamic> getAuditableFields() {
    return {
     RealtimeBase.CREATION_USERNAME_JSON: creationUsername,
      RealtimeBase.CREATION_DATETIME_JSON:
          RealtimeBase.getDatetimeAsString(creationDatetime),
      RealtimeBase.LAST_UPDATE_USERNAME_JSON: lastUpdateUsername,
      RealtimeBase.LAST_UPDATE_DATETIME_JSON:
          RealtimeBase.getDatetimeAsString(lastUpdateDatetime),
      RealtimeBase.DELETION_STATUS_JSON: deletionStatus,
      RealtimeBase.DELETION_USERNAME_JSON:
          deletionStatus ? deletionUsername : null,
      RealtimeBase.DELETION_DATETIME_JSON: deletionStatus
          ? RealtimeBase.getDatetimeAsString(deletionDatetime)
          : null,
      RealtimeBase.UI_KEY_JSON: uiKey,
    };
  }

  void fromJsonMapAudit(Map<String, dynamic> map) {
    print("rece map $map");

    print("js ${RealtimeBase.CREATION_USERNAME_JSON}");
    creationUsername = map[RealtimeBase.CREATION_USERNAME_JSON];
    creationDatetime = RealtimeBase.getDatetimeFromString(
        map[RealtimeBase.CREATION_DATETIME_JSON]);
   
    lastUpdateUsername = map[RealtimeBase.LAST_UPDATE_USERNAME_JSON];
    lastUpdateDatetime = RealtimeBase.getDatetimeFromString(
        map[RealtimeBase.LAST_UPDATE_DATETIME_JSON]);

    deletionStatus = map[RealtimeBase.DELETION_STATUS_JSON] == 1;
    deletionUsername =
        deletionStatus ? map[RealtimeBase.DELETION_USERNAME_JSON] : null;
    deletionDatetime = deletionStatus
        ? RealtimeBase.getDatetimeFromString(
            map[RealtimeBase.DELETION_DATETIME_JSON])
        : null;
    
    uiKey = map[RealtimeBase.UI_KEY_JSON];

  }

  void fromStoreMapAudit(Map? map) {
    
    creationUsername = map![RealtimeBase.CREATION_USERNAME_COLUMN];
    creationDatetime = RealtimeBase.getDatetimeFromString(
        map[RealtimeBase.CREATION_DATETIME_COLUMN]);

    lastUpdateUsername = map[RealtimeBase.LAST_UPDATE_USERNAME_COLUMN];
    lastUpdateDatetime = RealtimeBase.getDatetimeFromString(
        map[RealtimeBase.LAST_UPDATE_DATETIME_COLUMN]);
    deletionStatus = map[RealtimeBase.DELETION_STATUS_COLUMN] == 1;

    deletionUsername =
        deletionStatus ? map[RealtimeBase.DELETION_USERNAME_COLUMN] : null;
    deletionDatetime = deletionStatus
        ? RealtimeBase.getDatetimeFromString(
            map[RealtimeBase.DELETION_DATETIME_COLUMN])
        : null;
    uiKey = map[RealtimeBase.UI_KEY_COLUMN];
  }
  
  Map<String,dynamic> toStoreMapAuditable(){
    return 
    {
     
      RealtimeBase.CREATION_USERNAME_COLUMN: creationUsername,
      RealtimeBase.CREATION_DATETIME_COLUMN:
          RealtimeBase.getDatetimeAsString(creationDatetime),
      RealtimeBase.LAST_UPDATE_USERNAME_COLUMN: lastUpdateUsername,
      RealtimeBase.LAST_UPDATE_DATETIME_COLUMN:
          RealtimeBase.getDatetimeAsString(lastUpdateDatetime),
      RealtimeBase.DELETION_STATUS_COLUMN: deletionStatus ? 1 : 0,
      RealtimeBase.DELETION_USERNAME_COLUMN:
          deletionStatus ? deletionUsername : null,
      RealtimeBase.DELETION_DATETIME_COLUMN: deletionStatus
          ? RealtimeBase.getDatetimeAsString(deletionDatetime)
          : null,
      RealtimeBase.UI_KEY_COLUMN: uiKey,
    };
  }
 
  List<dynamic> getArgumentsAuditable(){
     return [
        creationUsername,
        RealtimeBase.getDatetimeAsString(creationDatetime),
        lastUpdateUsername,
        RealtimeBase.getDatetimeAsString(lastUpdateDatetime),
        deletionStatus ? 1 : 0,
        deletionStatus ? deletionUsername : null,
        deletionStatus
            ? RealtimeBase.getDatetimeAsString(deletionDatetime)
            : null,
        uiKey
      ];
  }
}