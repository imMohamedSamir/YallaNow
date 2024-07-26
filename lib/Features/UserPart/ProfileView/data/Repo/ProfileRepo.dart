import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/models/user_profile_details.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserProfileDetails>> fetchUserDetails();
  Future<Either<Failure, dynamic>> deletAccount();
  Future<Either<Failure, dynamic>> editUserProfile(
      {required UserProfileDetails userDetails});
}
