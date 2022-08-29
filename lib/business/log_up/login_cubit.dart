 import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:plane/cons.dart';
import 'package:plane/model/log/login_web.dart';
import 'package:plane/model/log/model.dart';

part 'login_state.dart';

 class LoginCubit extends Cubit<LoginState> {
   LoginCubit() : super(LoginInitial());
   ShopLoginModel? loginModel;

   static LoginCubit get(context) => BlocProvider.of(context);
   void userlogin({
     required String password,
     required String user_name,
   }) {
     emit(LoginLoading());
     LoginWeb.postData(url: "user/login", data: {
       "user_name": user_name,
       "password": password,
     }).then((value) {
       print("sucesssssssss");
       print('$token');

       loginModel = ShopLoginModel.fromJson(value.data);
       print(value.data);
       emit(LoginSuccess(loginModel!));
     }).catchError((error) {
       print(error.toString());
       emit(LoginError(error.toString()));
     });
   }




 }

