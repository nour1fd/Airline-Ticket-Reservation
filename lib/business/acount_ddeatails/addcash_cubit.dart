import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:plane/cons.dart';
import 'package:plane/model/addmoneymodel.dart';
import 'package:plane/model/log/login_web.dart';
import 'package:plane/model/modeling.dart';
part 'addcash_state.dart';

class AddcashCubit extends Cubit<AddcashState> {
  AddcashCubit() : super(AddcashInitial());
  addModel?addcashing;
static AddcashCubit get(context) => BlocProvider.of(context);
  void addcash({required int cash}){
    emit(AddcashLoading());
    LoginWeb.postData(url: 'users/payment/add-cash/$accountId',
      data: {
      "cash":cash
      }
    ).then((value){
      print("adding cash success");
      addcashing=(addModel.fromJson(value.data[0])) ;
      print(value.data);
      emit(AddcashSuccess(addcashing!));
    }).catchError((error) {
      print(error.toString()+"noniiiiiiiiiiiiiiiiii");
      emit(AddcashError(error.toString()));
    });
  }
}
