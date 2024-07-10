import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class DriverFileMangement {
  final FileDetails fileDetails = FileDetails();
  final ImagePicker _picker = ImagePicker();

  Future<FileDetails?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      fileDetails.driverFile = File(result.files.single.path!);
      fileDetails.fileName = result.files.single.name;
      fileDetails.contentType = result.files.single.extension ?? "";
      fileDetails.fileSize = result.files.single.size;
      log("fileName: ${fileDetails.fileName} fileType: ${fileDetails.contentType} fileSize: ${fileDetails.fileSize}");
      return fileDetails;
    } else {
      return null;
    }
  }

  Future<File?> pickImageFromgallery() async {
    File? img;
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      img = File(image.path);
      log('Image path: ${image.path}');
      return img;
    }
    return null;
  }
}

class FileDetails {
  File? driverFile;
  String? fileName, contentType;
  int? fileSize;

  FileDetails(
      {this.driverFile, this.fileName, this.contentType, this.fileSize});
  Map<String, dynamic> toJson() {
    return {
      'fileName': fileName,
      'contentType': contentType,
      'fileSize': fileSize,
      'driverFile': driverFile?.path,
    };
  }
}
