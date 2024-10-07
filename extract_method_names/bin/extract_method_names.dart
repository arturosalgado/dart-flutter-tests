import 'dart:io';

import 'package:path/path.dart' as path;

void main(List<String> arguments) {
  final filePath = 'test_file.dart1';
  final file = File(filePath);

  if (!file.existsSync()) {
    print('File not found: $filePath');
    return;
  }

  if (path.extension(filePath) != '.dart') {
    print('The provided file is not a Dart file.');
    return;
  }

  final content = file.readAsStringSync();
  final methodNames = extractMethodNames(content);

  print('Methods found in ${path.basename(filePath)}:');
  for (final name in methodNames) {
    print('- $name');
  }
}

List<String> extractMethodNames(String content) {
  final methodNames = <String>[];
  final regex = RegExp(
    r'(?:(?:void|Future<[^>]+>|[A-Za-z0-9_<>,]+)\s+)?(\w+)\s*\([^)]*\)\s*(?:async\s*)?\{',
    multiLine: true,
  );

  final matches = regex.allMatches(content);
  for (final match in matches) {
    if (match.groupCount >= 1) {
      final methodName = match.group(1);
      if (methodName != null && !methodName.startsWith('_')) {
        methodNames.add(methodName);
      }
    }
  }

  return methodNames;
}
