import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/utlis/functions/scaffoldMsgMethod.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/CheckOutPage.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/add_basket_cubit/add_basket_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class BasketButtonsSec extends StatelessWidget {
  const BasketButtonsSec({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<SelectedItemsModel>(kBasket);

    return BlocListener<AddBasketCubit, AddBasketState>(
      listener: (context, state) {
        if (state is AddBasketSuccess) {
          NavigateToPage.slideFromRight(
              context: context, page: const CheckOutPage());
        } else if (state is AddBasketFailure) {
          ScaffoldMsgMethod.showMsg(context, msg: state.errmsg, isError: true);
        }
      },
      child: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, box, _) {
          final items = box.values.toList();

          if (items.isEmpty) {
            return const SizedBox.shrink();
          } else {
            // final cubit = BlocProvider.of<BasketManagerCubit>(context);
            // cubit.getCurrentItems();

            return CustomButton(
              text: S.of(context).Checkout,
              txtcolor: Colors.white,
              btncolor: pKcolor,
              onPressed: () {
                NavigateToPage.slideFromRight(
                    context: context, page: const CheckOutPage());
              },
            );
          }
        },
      ),
    );
  }
}
