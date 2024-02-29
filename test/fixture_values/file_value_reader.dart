import 'dart:io';

String fileReader(String fileName) =>
    File('test/fixture_values/$fileName').readAsStringSync();
