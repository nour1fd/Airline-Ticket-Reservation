import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:plane/admin/cost.dart';
import 'package:plane/admin/model/adminmodel.dart';
import 'package:plane/admin/model/dio.dart';
import 'package:plane/model/flight_info/flightmodel.dart';

part 'updateflight_state.dart';

class UpdateflightCubit extends Cubit<UpdateflightState> {
  UpdateflightCubit() : super(UpdateflightInitial());
  FlightModeladmin? updateflight;
  static UpdateflightCubit get(context) => BlocProvider.of(context);
  void updatingflight({
    required String country,
    required String city,
    required int capacity,
    required String arrivals_to,
    required String departures_from,
    required String date_time,
  })
  {
    emit(UpdateflightLoading());
    Dio_Admin.postData(url: 'update-flight/nfd/$id'
        ,data:
        { "country": country,
          "city":city,
          "capacity":capacity,
          "arrivals_to":arrivals_to,
          "departures_from":departures_from,
          "date_time":date_time,
        }).then((value) {
      print("updation done");
      updateflight=FlightModeladmin.fromJson(value.data[0]);
      print(value.data);
      emit(UpdateflightSuccess(updateflight!));
    }).catchError((error){
      print(error.toString()+"mmmmmmmmmmmmmmmmmmmmm");
      emit(UpdateflightError(error.toString()));
    });
  }
}
