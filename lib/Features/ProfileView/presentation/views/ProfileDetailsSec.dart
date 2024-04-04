import 'package:flutter/widgets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/ProfileView/presentation/views/ProfileImgSec.dart';

class ProfileDetailsSec extends StatelessWidget {
  const ProfileDetailsSec({super.key});
  static ProfileDetailsModel profileDetailsModel = ProfileDetailsModel(
      name: 'Mohamed Samir', emailaddress: 'mousabsamir330@gamil.com');
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProfileImgSec(name: profileDetailsModel.name),
        const SizedBox(height: 12),
        Center(
          child: Text(profileDetailsModel.name,
              style: AppStyles.styleSemiBold20(context)
                  .copyWith(fontSize: 24, color: const Color(0xff212121))),
        ),
        const SizedBox(height: 2),
        Center(
          child: Text(profileDetailsModel.emailaddress,
              style: AppStyles.styleMedium14(context)
                  .copyWith(color: const Color(0xff212121))),
        )
      ],
    );
  }
}

class ProfileDetailsModel {
  final String name, emailaddress;

  ProfileDetailsModel({required this.name, required this.emailaddress});
}
