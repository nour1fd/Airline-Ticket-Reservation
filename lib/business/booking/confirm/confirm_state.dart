part of 'confirm_cubit.dart';

@immutable
abstract class ConfirmState {}

class ConfirmInitial extends ConfirmState {}
class ConfirmLoading extends ConfirmState {}
class ConfirmSuccess extends ConfirmState {

}
class ConfirmError extends ConfirmState {
  final String error;
  ConfirmError(this.error);
}
