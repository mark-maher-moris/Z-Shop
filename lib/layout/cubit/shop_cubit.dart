import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:z_shop/core/consts.dart';
import 'package:z_shop/models/categoriesModel.dart';
import 'package:z_shop/models/changeFavoritesModel.dart';
import 'package:z_shop/models/homeModel.dart';
import 'package:z_shop/modules/categories/categoriesScreen.dart';
import 'package:z_shop/modules/favorites/favoritesScreen.dart';
import 'package:z_shop/modules/products/productsSreen.dart';
import 'package:z_shop/modules/settings/settingsScreen.dart';
import 'package:z_shop/network/endPoints.dart';
import 'package:z_shop/shared/dio_helper.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);
  int currentScreenIndex = 0;
  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen()
  ];

  void changeBottomNavIndex(int index) {
    currentScreenIndex = index;
    emit(ShopChangeBottomNavState());
  }

  Map<int?, bool?> favorites = {};

  HomeModel? homeModel;
  void getHomeData() {
    emit(LoadingHomeDataState());
    DioHelper.getData(url: HOME, query: null, token: token).then((value) {
      homeModel = HomeModel.fromJson(value?.data);
      homeModel?.data!.products?.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });
      emit(SuccessLoadingHomeDataState());
    }).catchError((error) {
      print(error);
      emit(ErrorLoadingHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;
  void getCategories() {
    emit(LoadingHomeDataState());

    DioHelper.getData(url: CATEGORIES, query: null).then((value) {
      categoriesModel = CategoriesModel.fromJson(value?.data);
      emit(SuccessLoadingHomeDataState());
    }).catchError((error) {
      emit(ErrorLoadingHomeDataState());
      print(error);
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;
  void changeFavorites(int productId) {
    emit(ShopLoadingGetFavoritesState());
    favorites[productId] = !favorites[productId]!;
    emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));

    DioHelper.getData(
            url: FAVORITES, query: {'product_id': productId}, token: token)
        .then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value?.data);
      if (changeFavoritesModel?.status == false) {
        favorites[productId] = !favorites[productId]!;
      }
      print(value?.data);
      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      emit(ShopErrorChangeFavoritesState());
      print(error);
    });
  }
}
