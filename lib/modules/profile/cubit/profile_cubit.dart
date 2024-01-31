import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_shop/core/consts.dart';
import 'package:z_shop/models/loginModel.dart';
import 'package:z_shop/shared/dio_helper.dart';
import '../../../network/endPoints.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) {
    return BlocProvider.of(context);
  }
  LoginModel? loginModel;
  addToCart({
    required String productId,
  }) {
    emit(ProfileLoadingState());
    DioHelper.postData(
            url: CART,
            data: {'product_id': productId},
            token: token,
            query: null)
        .then((value) {})
        .catchError((error) {
      emit(ProfileErrorState(error));

      print(error);
    });
  }
}
