import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:plane/model/log/login_web.dart';
import 'package:plane/model/log/model.dart';

part 'singup_state.dart';

class SingupCubit extends Cubit<SingupState> {
  SingupCubit() : super(SingupInitial());
  ShopLoginModel ?loginModel ;

  static SingupCubit get(context)=>BlocProvider.of(context);
 void userRegister({
    required String name,
    required String email,
    required String password,
    required String user_name,

  })   {
    emit(SingupLoading());
    LoginWeb.postData(url: "user/register",
        data: {
          "name":name,
          "email":email,
          "password":password,
          "user_name":user_name,
        }
    ).then((value) {
      print("sucesssssssss");
      loginModel=ShopLoginModel.fromJson(value.data);
      print(value.data);
      emit(SingupSuccess(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(LoginError(error.toString()));
    });
  }
}
