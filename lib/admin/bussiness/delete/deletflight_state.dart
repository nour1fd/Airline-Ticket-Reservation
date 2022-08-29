part of 'deletflight_cubit.dart';

@immutable
abstract class DeletflightState {}

class DeletflightInitial extends DeletflightState {}
class   DeletflightLoading extends DeletflightInitial {}
class   DeletflightSuccess extends DeletflightInitial {

}
class   DeletflightError extends DeletflightInitial {
  final String error;

  DeletflightError(this.error);
}