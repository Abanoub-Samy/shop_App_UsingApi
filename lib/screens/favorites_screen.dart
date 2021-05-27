import 'package:flutter/material.dart';
import 'package:shop_app_with_api/shared/cubit/app_cubit.dart';
import 'package:shop_app_with_api/widgets/favorite_screen_widget.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppCubit().getFavoritesData();
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (ctx, index) => favoriteItem(
        AppCubit.get(context).favoritesModel!.data!.dataFavor![index],
        context,
      ),
      separatorBuilder: (ctx, index) => Divider(),
      itemCount: AppCubit.get(context).favoritesModel!.data!.dataFavor!.length,
    );
  }
}
