import 'package:flutter/material.dart';
import 'package:shop_app_with_api/screens/onBoarding_screen.dart';

class OnBoardingItem extends StatelessWidget {
  final BoardingModel list ;

  OnBoardingItem({ required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image(
            image: AssetImage(list.image),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          list.title,
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          list.body,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
