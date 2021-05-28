import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/shared/cubit/app_cubit.dart';
import 'package:shop_app_with_api/shared/cubit/app_states.dart';
import 'package:shop_app_with_api/widgets/favorite_screen_widget.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit().getFavoritesData();
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (ctx, index) => favoriteItem(
            AppCubit.get(context)
                .favoritesModel!
                .data!
                .dataFavor![index]
                .product,
            context,
          ),
          separatorBuilder: (ctx, index) => Divider(),
          itemCount:
              AppCubit.get(context).favoritesModel!.data!.dataFavor!.length,
        );
      },
    );
  }
}
