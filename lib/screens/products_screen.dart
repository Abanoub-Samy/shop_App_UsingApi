// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/shared/cubit/app_cubit.dart';
import 'package:shop_app_with_api/shared/cubit/app_states.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (ctx, state) {
          return ConditionalBuilder(
            condition: AppCubit.get(context).homeModel != null,
            builder: (ctx) => Column(
              children: [],
            ),
            fallback: (ctx) => Center(child: CircularProgressIndicator()),
          );
        },
        listener: (ctx, state) {});
  }
}
