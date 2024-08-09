import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/add_fav_model.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/presentation/manager/add_fav_cubit/add_fav_cubit.dart';

class FavIcon extends StatefulWidget {
  const FavIcon(
      {super.key,
      this.height,
      this.favorite,
      this.addFavModel,
      this.partnerId});
  final AddFavModel? addFavModel;
  final double? height;
  final bool? favorite;
  final String? partnerId;
  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  late bool active;

  @override
  void initState() {
    super.initState();
    active = widget.favorite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Add_Remove_FavCubit, AddFavState>(
      builder: (context, state) {
        return Container(
          width: widget.height ??
              AppSizes.getWidth(
                  24, context), // Adjust width and height as needed
          height: widget.height ?? AppSizes.getHeight(24, context),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white, // Background color of the icon
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              active == true ? Icons.favorite : Icons.favorite_border_outlined,
              color: active == true ? pKcolor : const Color(0xff5A5A5A),
              size: 20,
            ),
            onPressed: () {
              var cubit = BlocProvider.of<Add_Remove_FavCubit>(context);
              // active = !active;
              if (!active) {
                widget.addFavModel!.isFavorite = true;
                cubit.add(favModel: widget.addFavModel!);
                setState(() {
                  active = true;
                });
              } else {
                cubit.remove(favId: widget.partnerId!);
                setState(() {
                  active = false;
                });
              }
            },
          ),
        );
      },
    );
  }
}
