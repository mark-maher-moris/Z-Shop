import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_shop/models/loginModel.dart';
import 'package:z_shop/shared/dio_helper.dart';
import '../../../network/endPoints.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  static CartCubit get(context) {
    return BlocProvider.of(context);
  }

  LoginModel? loginModel;

  addToCart({required String productId}) {
    emit(CartLoadingState());
    DioHelper.postData(url: CART, data: {'product_id': productId})
        .then((value) {})
        .catchError((error) {
      emit(CartErrorState(error));

      print(error);
    });
  }
}
