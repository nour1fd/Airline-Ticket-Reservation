part of 'addcash_cubit.dart';

@immutable
abstract class AddcashState {}

class AddcashInitial extends AddcashState {}
class AddcashLoading extends AddcashInitial {}

class AddcashSuccess extends AddcashInitial {
  addModel?addcashing;

  AddcashSuccess(this.addcashing);
}

class AddcashError extends AddcashInitial {
  final String error;
  AddcashError(this.error);
}
