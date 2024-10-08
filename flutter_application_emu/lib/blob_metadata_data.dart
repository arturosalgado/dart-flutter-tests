import 'package:flutter_application_emu/data_converter.dart';

class BlobMetadataData extends DataConverter {
  //late String syncGuid;
  late String content;

  @override
  void fromStoreMapChild(Map<String, dynamic> map) {
    syncGuid = map['syncGuid'];
    content = map['content'];
  }

  @override
  Map<String, dynamic> toStoreMapChild() {
    return {'syncGuid': syncGuid, 'content': content};
  }

  @override
  String toString() {
    return 'Blob:{syncGuid:$syncGuid, content:$content}';
  }
}
