import 'package:flutter/material.dart';
import 'package:shop_app_with_api/screens/login_screen.dart';
import 'package:shop_app_with_api/shared/cache_helper.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TextButton(
          child: Text('Sign Out'),
          onPressed: (){
            CacheHelper.clearData(key: 'token');
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          },
        ),
      ),
    );
  }
}
