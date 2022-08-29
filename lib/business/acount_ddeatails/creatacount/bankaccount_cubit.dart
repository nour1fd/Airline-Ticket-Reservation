import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:plane/model/account_model.dart';
import 'package:plane/model/log/login_web.dart';
import 'package:plane/model/modeling.dart';

part 'bankaccount_state.dart';

class BankaccountCubit extends Cubit<BankaccountState> {
  BankaccountCubit() : super(BankaccountInitial());
  Model?craetingaccount;
  static BankaccountCubit get(context) => BlocProvider.of(context);
  void bankaccount({required String cash}){
    emit(BankaccountLoading());
    LoginWeb.postData(url: 'users/payment/create-account',
        data: {
          "cash":cash
        }
    ).then((value){
      print("adding cash success");
      craetingaccount=(Model.fromJson(value.data[0])) ;
      print(value.data);
      emit(BankaccountSuccess(craetingaccount!));
    }).catchError((error) {
      print(error.toString()+"noniiiiiiiii");
      emit(BankaccountError(error.toString()));
    });
  }
}
