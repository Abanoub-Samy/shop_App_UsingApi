import 'package:flutter/material.dart';
import 'package:shop_app_with_api/screens/login_screen.dart';
import 'package:shop_app_with_api/shared/cache_helper.dart';
import 'package:shop_app_with_api/shared/cubit/app_cubit.dart';
import 'package:shop_app_with_api/widgets/onBoarding_item.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
      body: 'On Board 1 Body',
      image: 'assets/images/shopa.jpg',
      title: 'On Board 1 Title',
    ),
    BoardingModel(
      body: 'On Board 2 Body',
      image: 'assets/images/shopb.jpg',
      title: 'On Board 2 Title',
    ),
    BoardingModel(
      body: 'On Board 3 Body',
      image: 'assets/images/shopc.jpg',
      title: 'On Board 3 Title',
    ),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            AppCubit.get(context).changeAppMode();
          },
          icon: AppCubit.get(context).isDark
              ? Icon(
            Icons.brightness_4_outlined,
            color: Colors.black,
          )
              : Icon(
            Icons.brightness_4_outlined,
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                CacheHelper.saveData(key: 'onBoarding', value: true)
                    .then((value) {
                  if (value) {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  }
                });
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: AppCubit.get(context).isDark
                      ? Colors.black
                      : Colors.white,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, index) => OnBoardingItem(
                  list: boarding[index],
                ),
                itemCount: boarding.length,
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Theme.of(context).accentColor,
                    activeDotColor: Theme.of(context).primaryColor,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                ),
                Text(
                  'Indicator',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (isLast) {
                      CacheHelper.saveData(key: 'onBoarding', value: true)
                          .then((value) {
                        if (value) {
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        }
                      });
                    }
                    boardController.nextPage(
                      duration: Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class BoardingModel {
  final String title;

  final String image;

  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}
