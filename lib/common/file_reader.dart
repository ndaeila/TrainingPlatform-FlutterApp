import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileReader {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> getLocalFile(String fileName) async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  /// fileName must include .txt suffix.
  /// Only include the fileName and omit its path.
  Future<String> readFile(String fileName) async {
    try {
      File file = await getLocalFile(fileName);
      String fileContents = await file.readAsString();
      print('Contents of $fileName is: $fileContents');
      return file.readAsString();
    } catch (e) {
      print(e.toString());
      return "Error occurred while reading $fileName";
    }
  }
}
