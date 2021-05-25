// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_with_api/models/categories_model.dart';
import 'package:shop_app_with_api/models/home_models.dart';
import 'package:shop_app_with_api/shared/cubit/app_cubit.dart';

Widget productBuilder(HomeModel? homeModel, CategoriesModel? categoriesModel,
        BuildContext context) =>
    SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: homeModel!.data!.banners!
                .map((e) => Image(
                      image: NetworkImage(e.image.toString()),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
              height: 250,
              initialPage: 0,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Container(
                  height: 100,
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          categoryItem(categoriesModel!.data!.data![index]),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: categoriesModel!.data!.data!.length),
                ),
                Text(
                  'New Products',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
              childAspectRatio: 1 / 1.79,
              children: List.generate(
                homeModel.data!.products!.length,
                (index) => builderGridProduct(
                    homeModel.data!.products![index], context),
              ),
            ),
          ),
        ],
      ),
    );

Widget builderGridProduct(ProductModel? model, BuildContext context) =>
    Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(
                  model!.image.toString(),
                ),
                width: double.infinity,
                height: 200,
              ),
              if (model.discount != 0)
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Text(
                    'Discount',
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.3,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      model.price.round().toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (model.discount != 0)
                      Text(
                        model.oldPrice.round().toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        AppCubit.get(context).changeFavorites(model.id);
                      },
                      icon: categoryIcon(
                          AppCubit.get(context).favorites[model.id]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

Widget categoryItem(DataModel model) => Stack(
      children: [
        Image(
          width: 80,
          height: 80,
          image: NetworkImage(model.image.toString()),
          fit: BoxFit.cover,
        ),
        Container(
          width: 80,
          color: Colors.black.withOpacity(0.8),
          child: Text(
            model.name.toString(),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );

Widget categoryIcon(bool? value) => Icon(
      value! ? Icons.favorite : Icons.favorite_border,
      color: value ? Colors.red : Colors.black,
    );
