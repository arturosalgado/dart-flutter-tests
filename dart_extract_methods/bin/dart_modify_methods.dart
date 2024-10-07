import 'dart:io';

void main(List<String> arguments) {
  final filePath = 'lib/test.txt';
  final file = File(filePath);

  if (!file.existsSync()) {
    print('File not found: $filePath');
    return;
  } else {
    print("there is a file");
  }

  String content = file.readAsStringSync();
  String modifiedContent = modifyTestMethods(content);

  file.writeAsStringSync(modifiedContent);
}

String modifyTestMethods(String content) {
  RegExp methodRegex = RegExp(
    r'(Future<void>\s+test\w+\s*\()([^)]+)(\)\s*async)',
    multiLine: true,
  );

  return content.replaceAllMapped(methodRegex, (match) {
    String methodStart = match.group(1)!;
    String methodEnd = match.group(3)!;

    // Remove all parameters
    return '${methodStart}$methodEnd';
  });
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
