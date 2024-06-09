import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/HttpFailurs.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/Repo/DriverRegisterationRepo.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/models/DrRegisterModel.dart';
import 'package:http/http.dart' as http;

class DriverRegisterationRepoImpl implements DriverRegisterationRepo {
  @override
  Future<Either<FailureHttp, dynamic>> fetchRegisteration(
      {required DriverRegisterModel driverDetails}) async {
    String ur =
        "https://yallanow.runasp.net/api/Driver/RegisterNewDriver?DriverType=${driverDetails.driverType}";
    var request = http.MultipartRequest('POST', Uri.parse(ur));
    ///////////////////////////////////////////////////////
    // request.headers['Authorization'] = 'Bearer your_access_token';
    request.headers['Content-Type'] = 'multipart/form-data'; // Adjust as needed
    request.headers['accept'] = '*/*';
    request.fields['FirstName'] = driverDetails.firstName ?? '';
    request.fields['LastName'] = driverDetails.lastName ?? '';
    request.fields['Gender'] = driverDetails.gender ?? '';
    request.fields['Username'] = driverDetails.username ?? '';
    request.fields['PhoneNumber'] = driverDetails.phoneNumber ?? '';
    request.fields['Password'] = driverDetails.password ?? '';
    request.fields['Email'] = driverDetails.email ?? '';
    request.fields['FileName'] = driverDetails.driverPapers!.fileName ?? '';
    request.fields['ContentType'] =
        driverDetails.driverPapers!.contentType ?? '';
    request.fields['Size'] = driverDetails.driverPapers!.fileSize.toString();
    //////////////////////////////////////////////////////////////
    if (driverDetails.driverPapers!.driverFile != null) {
      var filePart = await http.MultipartFile.fromPath(
          'file', driverDetails.driverPapers!.driverFile!.path);
      request.files.add(filePart);
    }
    ///////////////////////////////////////
    try {
      // Send the multipart request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        // log('Registration and file upload successful');
        // log('Response body: ${response.body}');

        return right(response.body);
      } else {
        // log('Registration and file upload failed. Status code: ${response.statusCode}');
        // log('Response body: ${response.body}');
        return left(ServerFailureHttp.fromHttpError(response));
      }
    } on Exception catch (e) {
      return left(
        ServerFailureHttp(
          e.toString(),
        ),
      );
    }
  }
}
