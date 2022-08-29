part of 'view_cubit.dart';

@immutable
abstract class ViewState {}

class ViewInitial extends ViewState {}
class Viewloaded extends ViewState{
  final List<FlightModel> flighting;

  Viewloaded(this.flighting);
}
