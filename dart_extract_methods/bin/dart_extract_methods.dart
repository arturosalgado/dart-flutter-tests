import 'dart:io';

import 'package:path/path.dart' as path;

void main(List<String> arguments) {
  final filePath = 'lib/test.txt';
  final file = File(filePath);

  if (!file.existsSync()) {
    print('File not found: $filePath');
    return;
  } else {
    print("there is a file");
  }

  final content = file.readAsStringSync();
  final methodNames = extractMethodNames(content);

  print('Methods found in ${path.basename(filePath)}:');
  for (final name in methodNames) {
    print(name);
  }
}

List<String> extractMethodNames(String content) {
  final methodNames = <String>[];
  final regex = RegExp(
    r'(?:(?:void|Future<[^>]+>|[A-Za-z0-9_<>,]+)\s+)?(test\w+)\s*\([^)]*\)\s*(?:async\s*)?\{',
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
