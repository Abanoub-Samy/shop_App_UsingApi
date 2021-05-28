import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/models/categories_model.dart';
import 'package:shop_app_with_api/shared/cubit/app_cubit.dart';
import 'package:shop_app_with_api/shared/cubit/app_states.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getCategoriesData();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (ctx, index) => catItem(
              AppCubit.get(context).categoriesModel!.data!.data![index]),
          separatorBuilder: (ctx, index) => Divider(),
          itemCount: AppCubit.get(context).categoriesModel!.data!.data!.length,
        );
      },
    );
  }
}

Widget catItem(DataModel model) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image(
            image: NetworkImage(model.image.toString()),
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          Text(
            model.name.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward),
        ],
      ),
    );
