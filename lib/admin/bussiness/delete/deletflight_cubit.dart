import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:plane/admin/cost.dart';
import 'package:plane/admin/model/adminmodel.dart';
import 'package:plane/admin/model/dio.dart';
import 'package:plane/model/flight_info/flightmodel.dart';

part 'deletflight_state.dart';

class DeletflightCubit extends Cubit<DeletflightState> {
  DeletflightCubit() : super(DeletflightInitial());

  FlightModeladmin? deletflight;
  static DeletflightCubit get(context) => BlocProvider.of(context);


  void deleteAddress() {
    emit(DeletflightLoading());
    Dio_Admin.deleteData(
      url: 'cancel-flight/nfd/$id',
    ).then((value) {
      deletflight = FlightModeladmin.fromJson(value.data[0]);
      print('delete Address ' + deletflight!.toString());
      emit(DeletflightSuccess());
    }).catchError((error) {
      emit(DeletflightError(error.toString()));
      print(error.toString());
    });
  }
}
