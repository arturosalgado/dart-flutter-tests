import 'package:flutter_application_emu/identifiable.dart';
import 'package:flutter_application_emu/store.dart';

abstract class DataConverter with Identifiable {
  late Store store;
}
