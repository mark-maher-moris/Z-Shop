import '../../../models/loginModel.dart';
abstract class CartStates {}
class CartInitialState extends CartStates {}
class CartLoadingState extends CartStates {}
class CartErrorState extends CartStates {
  final String error;
  CartErrorState(this.error);
}

class CartSuccessState extends CartStates {
  final LoginModel? loginModel;
  CartSuccessState({this.loginModel});
}
class ChangePasswordVisibilityState extends CartStates {}

