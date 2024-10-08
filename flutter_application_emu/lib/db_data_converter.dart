import 'package:flutter_application_emu/blob_metadata_data.dart';
import 'package:flutter_application_emu/data_converter.dart';
import 'package:flutter_application_emu/identifiable.dart';
import 'package:flutter_application_emu/user_data.dart';

class DbDataConverter {
  static T instantiate<T extends DataConverter>({String? syncCommandName}) {
    final Map<Type, DataConverter Function()> constructors =
        <Type, DataConverter Function()>{
      UserData: () => UserData(),
      BlobMetadataData: () => BlobMetadataData()
    };

    T dataConverter;

    if (constructors.containsKey(T)) {
      dataConverter = constructors[T]!() as T;
    } else {
      throw Exception('Data converter not found');
    }

    return dataConverter;
  }

  static Future<T?> findById<T extends DataConverter>(String id) async {
    dynamic item = (Identifiable.getById(id) as T);

    if (item != null) {
      print(
          "this comes from the Identity map $item its type is ${item.runtimeType}");
      return item;
    }
    // simulate retrieve from DB and save to Identifiable
    item = instantiate<T>();
    print('empty item  $item is of type ${item.runtimeType}');
    Map<String, dynamic> objectData = item.store.query(id);
    item.fromStoreMap(objectData);
    Identifiable.keep(item.syncGuid, item); // test is the exact same instance

    return item;
  }
}
