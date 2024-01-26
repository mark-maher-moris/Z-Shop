import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_shop/layout/cubit/shop_cubit.dart';
import 'package:z_shop/models/categoriesModel.dart';
import 'package:z_shop/modules/products/productsSreen.dart';
import '../../core/themes/themes.dart';
import '../../shared/componants/componants.dart';

String? selectedCategoryId;

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
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
        if (cubit.categoriesModel == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
              body: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: cubit.categoriesModel!.data?.data?.length,
                    shrinkWrap: false,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => CategorySideBox(
                        model: cubit.categoriesModel!.data?.data?[index]),
                  )),
              VerticalDivider(),
              Expanded(
                  flex: 3,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: cubit.homeModel!.data!.products!.length,
                    shrinkWrap: false,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => buildProductWidget(
                        cubit.homeModel!.data!.products![index], context),
                  )),
            ],
          ));
        }
      },
    );
  }
}

class CategorySideBox extends StatefulWidget {
  CategorySideBox({required this.model});
  var model;
  @override
  State<CategorySideBox> createState() => _CategorySideBoxState();
}

class _CategorySideBoxState extends State<CategorySideBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(widget.model.name);
        setState(() {
          selectedCategoryId = widget.model.id.toString();
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 5,
            //right: 5,
            child: Container(
              margin: EdgeInsets.all(5),
              height: 100,
              width: 110,
              decoration: BoxDecoration(
                  color: selectedCategoryId == widget.model.id
                      ? const Color.fromARGB(255, 60, 255, 67)
                      : mainColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            //width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    widget.model.image,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Container(
                    color: Color.fromARGB(121, 0, 0, 0),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.model.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 15,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
