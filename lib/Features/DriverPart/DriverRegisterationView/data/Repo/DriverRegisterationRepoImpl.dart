import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/Repo/DriverRegisterationRepo.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/models/DrRegisterModel.dart';

class DriverRegisterationRepoImpl implements DriverRegisterationRepo {
  final Dio _dio = Dio();

  @override
  Future<Either<Failure, dynamic>> fetchRegisteration({
    required DriverRegisterModel driverDetails,
  }) async {
    try {
      String url =
          "https://yallanow.runasp.net/api/Driver/RegisterNewDriver?DriverType=${driverDetails.driverType}";

      // Create FormData object
      FormData formData = FormData.fromMap({
        'FirstName': driverDetails.firstName ?? '',
        'LastName': driverDetails.lastName ?? '',
        'Gender': driverDetails.gender ?? '',
        'PhoneNumber': driverDetails.phoneNumber ?? '',
        'Password': driverDetails.password ?? '',
        'Email': driverDetails.email ?? '',
        "Address": driverDetails.address ?? '',
        'FileName': driverDetails.driverPapers!.fileName ?? '',
        'ContentType': driverDetails.driverPapers!.contentType ?? '',
        'Size': driverDetails.driverPapers!.fileSize.toString(),
        'LicensePlate': driverDetails.licensePlate ?? '',
        'VehicleModel': driverDetails.vehicleModel ?? '',
        'VehicleYear': driverDetails.vehicleYear ?? '',
        'VehicleColor': driverDetails.vehicleColor ?? '',
        'VehicleType': driverDetails.vehicleType.toString(),
      });

      // Add files to FormData
      if (driverDetails.driverPapers!.driverFile != null) {
        formData.files.add(MapEntry(
          'file',
          await MultipartFile.fromFile(
              driverDetails.driverPapers!.driverFile!.path),
        ));
      }
      if (driverDetails.driverImg != null) {
        formData.files.add(MapEntry(
          'Image',
          await MultipartFile.fromFile(driverDetails.driverImg!.path),
        ));
      }
      if (driverDetails.vehicleImg != null &&
          driverDetails.vehicleImg!.isNotEmpty) {
        for (var vehicleImage in driverDetails.vehicleImg!) {
          formData.files.add(MapEntry(
            'VehicleImages',
            await MultipartFile.fromFile(vehicleImage!.path),
          ));
        }
      }

      // Send the request
      var response = await _dio.post(
        url,
        data: formData,
        options: Options(
          headers: {'accept': '*/*', 'Content-Type': 'multipart/form-data'},
        ),
      );

      if (response.statusCode == 200) {
        return right(response.data);
      } else {
        return left(
            ServerFailure('Failed with status code: ${response.statusCode}'));
      }
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }
}
