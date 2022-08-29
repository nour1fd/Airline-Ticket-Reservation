part of 'loginadmin_cubit.dart';

@immutable
abstract class LoginadminState {}

class LoginadminInitial extends LoginadminState {}
class LoginadminLoading extends LoginadminState {}

class LoginadminSuccess extends LoginadminState {
  final ShopLoginModel loginModel;

  LoginadminSuccess(this.loginModel);
}

class LoginadminError extends LoginadminState {
  final String error;
  LoginadminError(this.error);
}
