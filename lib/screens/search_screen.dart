import 'package:flutter/material.dart';
import 'package:shop_app_with_api/shared/cubit/app_cubit.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = '/search-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(AppCubit.get(context).homeModel.toString()),
      ),
    );
  }
}
