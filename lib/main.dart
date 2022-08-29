import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plane/business/booking/booking_cubit.dart';
import 'package:plane/business/log_up/login_cubit.dart';
import 'package:plane/business/view/view_cubit.dart';
import 'package:plane/model/flight_info/flightmodel.dart';
import 'package:plane/model/log/login_web.dart';
import 'package:plane/model/shared/cachhelper.dart';
import 'package:plane/model/view/flight_web.dart';
import 'package:plane/model/view/flightpost.dart';
import 'package:plane/view/auth/login.dart';
import 'package:plane/view/auth/on_boarding.dart';
import 'package:plane/view/pages/booking_flight.dart';
import 'package:plane/view/pages/detailsforoneflight.dart';
import 'package:plane/view/pages/home_page.dart';

import 'admin/model/dio.dart';
import 'business/acount_ddeatails/addcash_cubit.dart';
import 'cons.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LoginWeb.init();
  Dio_Admin.init();

  await cachHelper.init();
  dynamic onBoardingFinish = false;
  onBoardingFinish = cachHelper.getData('boarding');
  token = cachHelper.getData('token');
  accountId=cachHelper.getData("account");
  userId=cachHelper.getData("id");
  user_name=cachHelper.getData("username");
  email=cachHelper.getData("email");
  name=cachHelper.getData("name");

  print("onBordint : " + "$onBoardingFinish");

  late Widget start;
  if (onBoardingFinish != null) {
    if (token == null) {
      print("tokin is :" + "$token");
      start = LogIn();
    } else {
      start = HomePage();
    }
  } else {
    start = OnBoardingScreen();
  }

  runApp(MyApp(start));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Widget start;
  MyApp(this.start);

  characterrepost caracter = characterrepost(characterweb());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => AddcashCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => ViewCubit(caracter),
            // child: BookingFlight()
          ),
          BlocProvider(
            create: (context) => BookingCubit(),
          ),
        ],
        child: MaterialApp(
          home: start,
          debugShowCheckedModeBanner: false,
        ));
  }
}
