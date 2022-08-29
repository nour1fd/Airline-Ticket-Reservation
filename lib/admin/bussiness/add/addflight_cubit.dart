import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:plane/admin/model/adminmodel.dart';
import 'package:plane/admin/model/dio.dart';
import 'package:plane/model/flight_info/flightmodel.dart';

part 'addflight_state.dart';

class AddflightCubit extends Cubit<AddflightState> {
  AddflightCubit() : super(AddflightInitial());
  FlightModeladmin? addflight;
  static AddflightCubit get(context) => BlocProvider.of(context);
  void addingdlight({
    required String country,
    required String city,
    required int capacity,
    required String arrivals_to,
    required String departures_from,
    required String date_time,
    required int admin_id,
  }) {
    emit(AddflightLoading());
    Dio_Admin.postData(url: "add-flight/nfd", data:
    { "country": country,
      "city":city,
      "capacity":capacity,
      "arrivals_to":arrivals_to,
      "departures_from":departures_from,
      "date_time":date_time,
      "admin_id":admin_id
    }
    ).then((value) {
      print("adiiing dooooof");
      addflight=FlightModeladmin.fromJson(value.data);
      print(value.data);
      emit(AddflightSuccess(addflight!)
      );
    }).catchError((error){
      print(error.toString());
      emit(AddflightError(error.toString()));
    });
  }
}
