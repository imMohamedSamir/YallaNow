import 'dart:io';

import 'package:file_picker/file_picker.dart';

class DriverFileMangement {
  FileDetails fileDetails = FileDetails();

  Future<FileDetails?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      fileDetails.driverFile = File(result.files.single.path!);
      fileDetails.fileName = result.files.single.name;
      fileDetails.contentType = result.files.single.extension ?? "";
      fileDetails.fileSize = result.files.single.size;
      print(
          "fileName: ${fileDetails.fileName} fileType: ${fileDetails.contentType} fileSize: ${fileDetails.fileSize}");
      return fileDetails;
    } else {
      return null;
    }
  }
}

class FileDetails {
  File? driverFile;
  String? fileName, contentType;
  int? fileSize;

  FileDetails(
      {this.driverFile, this.fileName, this.contentType, this.fileSize});
}
