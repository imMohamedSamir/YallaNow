// import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
// import 'package:bookly/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:yallanow/Core/utlis/Google_Api_services.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/Repo/DriverRegisterationRepoImpl.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepoImpl.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepoImpl.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/Repo/ProfileRepoImpl.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepoImpl.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Repo/HomeRepoImpl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<GoogleMapsServices>(GoogleMapsServices(Dio()));
  getIt.registerSingleton<YallaNowServices>(YallaNowServices(Dio()));
  getIt.registerSingleton<YallaNowServicesHttp>(YallaNowServicesHttp());

  getIt.registerSingleton<DriverRegisterationRepoImpl>(
      DriverRegisterationRepoImpl());
  getIt.registerSingleton<AddressesRepoImpl>(AddressesRepoImpl(
      getIt.get<GoogleMapsServices>(), getIt.get<YallaNowServices>()));
  getIt.registerSingleton<FoodRepoImpl>(
      FoodRepoImpl(yallaNowServices: getIt.get<YallaNowServices>()));
  getIt.registerSingleton<AuthRepoImpl>(
      AuthRepoImpl(yallaNowServicesHttp: getIt.get<YallaNowServicesHttp>()));
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(yallaNowServices: getIt.get<YallaNowServices>()));
  getIt.registerSingleton<ProfileRepoImpl>(
      ProfileRepoImpl(yallaNowServices: getIt.get<YallaNowServices>()));
}
