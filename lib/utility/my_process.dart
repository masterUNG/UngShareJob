import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MyProcess {
  Future<File> takePhoto({required ImageSource source}) async {
    var result = await ImagePicker().pickImage(
      source: source,
      maxWidth: 800,
      maxHeight: 800,
    );
    return File(result!.path);
  }
} // end Class