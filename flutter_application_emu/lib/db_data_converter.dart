import 'package:flutter_application_emu/blob_metadata_data.dart';
import 'package:flutter_application_emu/data_converter.dart';
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
}
