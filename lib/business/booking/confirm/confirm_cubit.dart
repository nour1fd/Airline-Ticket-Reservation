import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:plane/cons.dart';
import 'package:plane/model/log/login_web.dart';
part 'confirm_state.dart';

class ConfirmCubit extends Cubit<ConfirmState> {
  ConfirmCubit() : super(ConfirmInitial());

  static ConfirmCubit get(context)=>BlocProvider.of(context);
  void confirmbookticket(){
    emit( ConfirmLoading());
    LoginWeb.postData(url:"users/payment/buy-request/$costing/$accountId",
        data: {
        }
    ).then((value){
      print("confirm   Booking  sucesssssssss");
      print(value.data);
      emit( ConfirmSuccess());
    }).catchError((error) {
      print(error.toString());
      emit( ConfirmError(error.toString()));
    });
  }


}
