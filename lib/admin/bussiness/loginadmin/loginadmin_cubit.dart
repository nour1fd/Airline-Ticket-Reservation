import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:plane/model/log/login_web.dart';
import 'package:plane/model/log/model.dart';

part 'loginadmin_state.dart';

class LoginadminCubit extends Cubit<LoginadminState> {
  LoginadminCubit() : super(LoginadminInitial());
  ShopLoginModel? loginModeladmin;
  static LoginadminCubit get(context) => BlocProvider.of(context);
  void userloginAdmin({
    required String admin_code,
    required String user_name,
  }) {
    emit(LoginadminLoading());
    LoginWeb.postData(url: "admin/login", data: {
      "admin_code": admin_code,
      "user_name": user_name,

    }).then((value) {
      print("sucesssssssss");
      loginModeladmin = ShopLoginModel.fromJson(value.data);
      print(value.data);
      emit(LoginadminSuccess(loginModeladmin!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginadminError(error.toString()));
    });
  }
}
