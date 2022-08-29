part of 'singup_cubit.dart';

@immutable
abstract class SingupState {}

class SingupInitial extends SingupState {}
class SingupLoading extends SingupState {}
class SingupSuccess extends SingupState {
  final ShopLoginModel loginModel;

  SingupSuccess(this.loginModel);
}
class LoginError extends SingupState {
  final String error;
  LoginError(this.error);}
