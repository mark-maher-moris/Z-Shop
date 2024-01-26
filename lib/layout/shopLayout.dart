import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_shop/layout/cubit/shop_cubit.dart';
import 'package:z_shop/modules/search/searchScreen.dart';
import '../core/consts.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    },
                    icon: Icon(Icons.search))
              ],
              title: Container(
                  height: 60,
                  width: 100,
                  child: Image.asset(
                    logoPath,
                    fit: BoxFit.contain,
                  ))
              //  TextButton(
              //     onPressed: () {
              //       CacheHelper.removeData;
              //     },
              //     child: Text('SIGN OUT')),
              ),
          body: cubit.bottomScreens[cubit.currentScreenIndex],
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.green,
              currentIndex: cubit.currentScreenIndex,
              onTap: (index) {
                cubit.changeBottomNavIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category, color: Colors.black),
                    label: "Categories"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite, color: Colors.black),
                    label: "Favorites"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings, color: Colors.black),
                  label: "Settings",
                ),
              ]),
        );
      },
    );
  }
}
