// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/screens/login_screen.dart';
import 'package:shop_app_with_api/shared/cache_helper.dart';
import 'package:shop_app_with_api/shared/cubit/app_cubit.dart';
import 'package:shop_app_with_api/shared/cubit/app_states.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getProfileData();
    var name = TextEditingController();
    var phone = TextEditingController();
    var email = TextEditingController();
    var image = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context).profileModel;
        name.text = cubit!.data!.name.toString();
        phone.text = cubit.data!.phone.toString();
        email.text = cubit.data!.email.toString();
        image.text = cubit.data!.image.toString();
        return ConditionalBuilder(
          condition: AppCubit.get(context).profileModel != null,
          fallback: (context) => CircularProgressIndicator(),
          builder: (context) => Scaffold(
            body: Center(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 50,
                        child: Image(image: NetworkImage(image.toString()),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        enableInteractiveSelection: false,
                        focusNode: new AlwaysDisabledFocusNode(),

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        enableInteractiveSelection: false,
                        focusNode: new AlwaysDisabledFocusNode(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: phone,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        enableInteractiveSelection: false,
                        focusNode: new AlwaysDisabledFocusNode(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        child: Text('Sign Out'),
                        onPressed: () {
                          CacheHelper.clearData(key: 'token');
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                          AppCubit.get(context).changeBottom(0);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
