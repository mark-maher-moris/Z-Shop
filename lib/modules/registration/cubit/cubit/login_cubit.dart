import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:z_shop/core/consts.dart';

import 'package:z_shop/models/loginModel.dart';
import 'package:z_shop/shared/chach_helper.dart';

import 'package:z_shop/shared/dio_helper.dart';

import 'package:z_shop/modules/registration/cubit/cubit/login_state.dart';

import 'package:z_shop/network/endPoints.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) {
    return BlocProvider.of(context);
  }

  LoginModel? loginModel;

  void userLogin({@required String? email, @required String? password}) {
    emit(LoginLoadingState());

    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      loginModel = LoginModel.fromJson(value?.data);
      token = loginModel!.data?.token;
      CacheHelper.saveData(key: 'token', value: token);
      emit(LoginSuccessState(loginModel: loginModel));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;

  bool isVisibile = true;

  void changePasswordVidibility() {
    isVisibile = !isVisibile;

    suffix =
        isVisibile ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(ChangePasswordVisibilityState());
  }
}
