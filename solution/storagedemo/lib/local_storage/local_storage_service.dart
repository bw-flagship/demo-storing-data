import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

class LocalStorageService {
  Future<String> get _filePath async {
    final directory = await getApplicationDocumentsDirectory();
    return "${directory.path}/somefilename.png";
  }

  Future<void> writeFile(Uint8List bytes) async {
    final file = File(await _filePath);
    await file.writeAsBytes(bytes);
  }

  Future<File> getFile() async {
    return File(await _filePath);
  }
}
