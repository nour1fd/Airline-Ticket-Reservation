part of 'updateflight_cubit.dart';

@immutable
abstract class UpdateflightState {}

class UpdateflightInitial extends UpdateflightState {}
class   UpdateflightLoading extends UpdateflightInitial {}
class UpdateflightSuccess extends UpdateflightInitial {
  final FlightModeladmin Updateflight;
  UpdateflightSuccess(this.Updateflight);
}
class  UpdateflightError extends UpdateflightInitial {
  final String error;
  UpdateflightError(this.error);
}