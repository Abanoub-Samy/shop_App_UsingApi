// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_with_api/shared/cubit/app_cubit.dart';
import 'package:shop_app_with_api/shared/cubit/app_states.dart';
import 'package:shop_app_with_api/widgets/flutter_toast.dart';
import 'package:shop_app_with_api/widgets/product_screen_widget.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // AppCubit()..getHomeData();
    // AppCubit()..getCategoriesData();
    return BlocConsumer<AppCubit, AppStates>(builder: (ctx, state) {
      return ConditionalBuilder(
        condition: AppCubit.get(context).homeModel != null &&
            AppCubit.get(context).categoriesModel != null,
        builder: (ctx) => productBuilder(
          AppCubit.get(context).homeModel,
          AppCubit.get(context).categoriesModel,
          context,
        ),
        fallback: (ctx) => Center(child: CircularProgressIndicator()),
      );
    }, listener: (ctx, state) {
      if (state is FavoritesSuccessState) {
        if (state.favoritesModel.status == false) {
          showToast(
            message: state.favoritesModel.message.toString(),
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      }
    });
  }
}
