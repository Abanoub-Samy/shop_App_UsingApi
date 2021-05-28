import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/models/search_model.dart';
import 'package:shop_app_with_api/shared/cubit/app_cubit.dart';
import 'package:shop_app_with_api/shared/cubit/app_states.dart';
import 'package:shop_app_with_api/widgets/product_screen_widget.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = '/search-screen';

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter text to search';
                      }
                      return null;
                    },
                    onFieldSubmitted: (String text) {
                      AppCubit.get(context).searchProduct(text: text);
                      print(text);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if (state is SearchLoadingState) LinearProgressIndicator(),
                if (state is SearchSuccessState)
                  Expanded(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (ctx, index) => searchItem(
                        AppCubit.get(context)
                            .searchModel!
                            .dataSearch!
                            .data![index],
                        context,
                      ),
                      separatorBuilder: (ctx, index) => Divider(),
                      itemCount: AppCubit.get(context)
                          .searchModel!
                          .dataSearch!
                          .data!
                          .length-1,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget searchItem(Data? model, BuildContext context) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                    model!.image.toString(),
                  ),
                  width: 120,
                  height: 120,
                ),
                // if (model.discount != 0)
                //   Container(
                //     color: Colors.red,
                //     padding: EdgeInsets.symmetric(
                //       horizontal: 5,
                //     ),
                //     child: Text(
                //       'Discount',
                //       style: TextStyle(
                //         fontSize: 9,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
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
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price!.round().toString(),
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
                      // if (model.discount != 0)
                      //   Text(
                      //     model.oldPrice!.round().toString(),
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: TextStyle(
                      //       fontSize: 10,
                      //       color: Colors.grey,
                      //       decoration: TextDecoration.lineThrough,
                      //     ),
                      //   ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          AppCubit.get(context).changeFavorites(model.id);
                        },
                        icon: searchFavoriteIcon(
                            AppCubit.get(context).favorites[model.id]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget searchFavoriteIcon(bool? value) => Icon(
  value! ? Icons.favorite : Icons.favorite_border,
  color: value ? Colors.red : Colors.black,
);