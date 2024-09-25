// ignore_for_file: constant_identifier_names





abstract class RealtimeBase {
  static String dbPath = '';
  static const String SYNC_GUID_COLUMN = 'sync_guid';
  static const String PARENT_SYNC_GUID_COLUMN = 'parent_sync_guid';
  static const String CREATION_USER_FULL_NAME_COLUMN =
      'creation_user_full_name';
  static const String CREATION_USERNAME_COLUMN = 'creation_username';
  static const String CREATION_DATETIME_COLUMN = 'creation_datetime';
  static const String LAST_UPDATE_USER_FULL_NAME_COLUMN =
      'last_update_user_full_name';
  static const String LAST_UPDATE_USERNAME_COLUMN = 'last_update_username';
  static const String LAST_UPDATE_DATETIME_COLUMN = 'last_update_datetime';
  static const String DELETION_STATUS_COLUMN = 'deletion_status';
  static const String DELETION_USER_FULL_NAME_COLUMN =
      'deletion_user_full_name';
  static const String DELETION_USERNAME_COLUMN = 'deletion_username';
  static const String DELETION_DATETIME_COLUMN = 'deletion_datetime';
  static const String UI_KEY_COLUMN = 'ui_key';

  static const String SYNC_GUID_JSON = 'syncGuid';
  static const String PARENT_SYNC_GUID_JSON = 'parentSyncGuid';
  static const String CREATION_USER_FULL_NAME_JSON = 'creationUserFullName';
  static const String CREATION_USERNAME_JSON = 'creationUsername';
  static const String CREATION_DATETIME_JSON = 'creationDatetime';
  static const String LAST_UPDATE_USER_FULL_NAME_JSON =
      'lastUpdateUserFullName';
  static const String LAST_UPDATE_USERNAME_JSON = 'lastUpdateUsername';
  static const String LAST_UPDATE_DATETIME_JSON = 'lastUpdateDatetime';
  static const String DELETION_STATUS_JSON = 'deletionStatus';
  static const String DELETION_USER_FULL_NAME_JSON = 'deletionUserFullName';
  static const String DELETION_USERNAME_JSON = 'deletionUsername';
  static const String DELETION_DATETIME_JSON = 'deletionDatetime';
  static const String UI_KEY_JSON = 'uiKey';
  // ignore: non_constant_identifier_names
  static final DateTime DATE_TIME_DEFAULT_VALUE = DateTime(1900, 1, 1);

 

  RealtimeBase();

  

  dynamic getDatabaseInstance();

  void dispose() {
    throw UnimplementedError('RealtimeBase.dispose');
  }

  static String getDateAsString(DateTime? date) {
    if (date == null) {
      return '';
    }

    return '${date.toIso8601String().substring(0, 10)}T00:00:00';
  }

  static String getDatetimeAsString(DateTime? datetime) {
    if (datetime == null) {
      return '';
    }

    return datetime.toUtc().toIso8601String();
  }

  static String getDatetimeAsStringForList(DateTime? datetime) {
    if (datetime == null) {
      return '';
    }

    return datetime.toUtc().toIso8601String();
  }

  static String getDatetimeLocalAsStringForList(DateTime? datetime) {
    if (datetime == null) {
      return '';
    }

    return datetime.toIso8601String();
  }

  static String getDatetimeAsStringForIndex(DateTime? datetime) {
    if (datetime == null) {
      return '';
    }

    String formattedDate ='';// DateFormat('yyyyMMddHHmmss').format(datetime);
    String milisenconds = datetime.millisecond.toString().padLeft(3, '0');
    String finalDate = '$formattedDate$milisenconds';

    return finalDate;
  }

  static DateTime? getDatetimeFromString(String? datetimeAsString) {
    if (datetimeAsString == null || datetimeAsString.isEmpty) {
      return null;
    }

    return DateTime.parse(datetimeAsString).toLocal();
  }

  static DateTime? getDateFromString(String? dateAsString) {
    if (dateAsString == null || dateAsString.isEmpty) {
      return null;
    }

    DateTime date = DateTime.parse(dateAsString);

    return DateTime(date.year, date.month, date.day);
  }
}
