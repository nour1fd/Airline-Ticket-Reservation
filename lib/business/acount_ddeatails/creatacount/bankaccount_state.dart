part of 'bankaccount_cubit.dart';

@immutable
abstract class BankaccountState {}

class BankaccountInitial extends BankaccountState {}
class BankaccountLoading extends BankaccountInitial {}

class BankaccountSuccess extends BankaccountInitial {
  Model?addcashing;

  BankaccountSuccess(this.addcashing);
}

class BankaccountError extends BankaccountInitial {
  final String error;
  BankaccountError(this.error);
}
