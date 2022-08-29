import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plane/model/flight_info/flightmodel.dart';
import 'package:plane/model/view/flightpost.dart';

part 'view_state.dart';

class ViewCubit extends Cubit<ViewState> {
  final characterrepost characterrepostt ;

  List <FlightModel> caracter=[];
  ViewCubit(  this.characterrepostt) : super(ViewInitial());
  List<FlightModel> gettll(){
    characterrepostt.gettall().then((character){
      emit(Viewloaded(character!));
      this.caracter=character;
    });
    return caracter;
  }
}
