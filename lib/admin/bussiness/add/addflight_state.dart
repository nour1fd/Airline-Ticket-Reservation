part of 'addflight_cubit.dart';

@immutable
abstract class AddflightState {}

class AddflightInitial extends AddflightState {}
class  AddflightLoading extends AddflightInitial {}
class  AddflightSuccess extends AddflightInitial {

  final FlightModeladmin addflight;
  AddflightSuccess(this.addflight);
}
class  AddflightError extends AddflightInitial {
  final String error;
  AddflightError(this.error);
}