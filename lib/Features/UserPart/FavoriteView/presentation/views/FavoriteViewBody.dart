import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/Repo/FavoriteRepoImpl.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/presentation/manager/fav_details_cubit/fav_details_cubit.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/presentation/views/FavoriteBuilder.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BlocProvider(
        create: (context) =>
            FavDetailsCubit(getIt.get<FavoriteRepoImpl>())..get(),
        child: Scaffold(
          appBar: favoriteAppBar(context, title: 'Favorite'),
          body: const FavoriteBuilder(),
        ),
      ),
    );
  }
}
