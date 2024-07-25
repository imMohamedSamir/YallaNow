import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/Repo/ProfileRepo.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/models/user_profile_details.dart';

part 'edit_user_details_state.dart';

class EditUserDetailsCubit extends Cubit<EditUserDetailsState> {
  EditUserDetailsCubit(this.profileRepo) : super(EditUserDetailsInitial());
  final ProfileRepo profileRepo;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  UserProfileDetails userdetails = UserProfileDetails();
  void edit() async {
    emit(EditUserDetailsLoading());
    if (key.currentState!.validate()) {
      key.currentState!.save();
      log("done editing \n ${userdetails.toJson().toString()}");
    }
    emit(EditUserDetailsSuccess());
  }

  void enableEdite() {
    emit(EditUserDetailsEnabeled());
  }
}
