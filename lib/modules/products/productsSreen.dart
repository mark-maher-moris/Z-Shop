import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_shop/core/themes/themes.dart';
import 'package:z_shop/layout/cubit/shop_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:z_shop/models/categoriesModel.dart';
import 'package:z_shop/models/homeModel.dart';
import 'package:z_shop/shared/componants/componants.dart';
import '../../mainAppBar.dart';
import 'viewProductScreen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessChangeFavoritesState) {
          if (state.model.status == false) {
            showToast(state.model.message, Colors.red);
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        if (cubit.homeModel == null || cubit.categoriesModel == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            appBar: mainAppBar(context: context),
            body: Center(
              child: buildProducts(
                  cubit.homeModel, context, cubit.categoriesModel),
            ),
          );
        }
      },
    );
  }
}

Widget buildProducts(
    HomeModel? homeModel, context, CategoriesModel? categoriesModel) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                            fontFamily: fontName,
                            color: Colors.black,
                            height: 1.5,
                            fontSize: 50),
                        children: [
                          TextSpan(
                              text: 'Explore ', style: TextStyle(fontSize: 20)),
                          TextSpan(
                            text: 'endless possibilities',
                          ),
                          TextSpan(
                              text: ' and shop Now! ',
                              style: TextStyle(
                                  fontSize: 30,
                                  backgroundColor:
                                      Colors.yellow.withOpacity(0.3))),
                        ])),
              ],
            )),
        CarouselSlider(
            items: homeModel?.data!.banners
                ?.map((e) => ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image(image: NetworkImage(e.image.toString()))))
                .toList(),
            options: CarouselOptions(
                viewportFraction: 0.7, height: 120, autoPlay: true)),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          child: ListView.builder(
              reverse: true,
              shrinkWrap: false,
              itemCount: categoriesModel!.data!.data?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  buildCategoryTap(categoriesModel.data?.data?[index].image)),
        ),
        SizedBox(
          height: 10,
        ),
        GridView.count(
          reverse: true,
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.2,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(
              homeModel!.data!.products!.length.toInt(),
              (index) => buildProductWidget(
                  homeModel.data!.products![index], context)),
        )
      ],
    ),
  );
}

Widget buildProductWidget(ProductModel model, context) {
  return InkWell(
    onTap: () {
      navigateTo(context, ViewProductScreen(productModel: model));
    },
    child: DottedBorder(
      padding: const EdgeInsets.all(8.0),
      color: mainColor,
      child: Stack(
        children: [
          Column(
            children: [
              Image(
                height: 100,
                width: 130,
                image: NetworkImage(model.image.toString()),
              ),
              Text(
                model.name.toString(),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
              Text(
                model.price.toString() + " EGP ",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                model.oldPrice.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough),
              )
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                icon: Icon(ShopCubit.get(context).favorites[model.id]!
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  ShopCubit.get(context).changeFavorites(model.id!.toInt());
                }),
          )
        ],
      ),
    ),
  );
}

Widget buildCategoryTap(name) {
  return Container(
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.only(bottom: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Color.fromARGB(255, 255, 235, 56),
    ),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.black),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
           name.toString(),
            style: TextStyle(
                fontFamily: fontName,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )
        ]),
      ),
    ),
  );
}

void navigateTo(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}
