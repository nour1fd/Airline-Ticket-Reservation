import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:plane/admin/bussiness/add/addflight_cubit.dart';
import 'package:plane/admin/bussiness/view/viewflight.dart';
import 'package:plane/admin/button/view/viewtrips.dart';
import 'package:plane/admin/homeadmin.dart';
import 'package:plane/admin/model/cashing.dart';

class AddTrip extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var country_controller = TextEditingController();
  var city_controller = TextEditingController();
  var capacity_controller = TextEditingController();
  var arrivals_to_controller = TextEditingController();
  var departures_from_controller = TextEditingController();
  var date_time_controller = TextEditingController();
  var admin_id_controller = TextEditingController();
  final ViewFlightgetxadmin viewController = Get.put(ViewFlightgetxadmin());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddflightCubit(),
        child: BlocConsumer<AddflightCubit, AddflightState>(
          listener: (context, state) {
            if(state is AddflightError){
              print("ading state doooooooooooooooooo");
            }


          },
          builder: (context, state) {
            AddflightCubit cubit = AddflightCubit.get(context);

            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white24,

                title: Text("Add new trip",style:
                Theme.of(context).textTheme.headline5!.copyWith(color:
                Colors.black,
                  fontWeight: FontWeight.bold,
                )),
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Form(
                        key: formkey,
                        child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 25.0,
                              ),
//country
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) return "can not be empty";
                                  return null;
                                },
                                onFieldSubmitted: (value) {
                                  print(value);
                                },
                                controller: country_controller,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  border: OutlineInputBorder(

                                  ),
                                  label: const Text(
                                    'country', style: TextStyle(fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                      color: Colors.deepOrangeAccent),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 20.0,
                              ),

                              //city
                              TextFormField(
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return 'password not can Empty';
                                  }
                                  return null;
                                },
                                controller: city_controller,
                                decoration: InputDecoration(
                                  isDense: false,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  border: OutlineInputBorder(

                                  ),
                                  label: const Text(
                                    'city', style: TextStyle(fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                      color: Colors.deepOrangeAccent),
                                  ),
                                ),
                                // onFieldSubmitted: (value) {
                                //   if(formkey.currentState!.validate()){
                                //     cubit.userlogin(
                                //         user_name: user_nameController.text,
                                //         password: passwordController.text);
                                //   }
                                // },
                                keyboardType: TextInputType.text,
                              ),

                              const SizedBox(
                                height: 25.0,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) return "can not be empty";
                                  return null;
                                },
                                onFieldSubmitted: (value) {
                                  print(value);
                                },
                                controller: capacity_controller,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  border: OutlineInputBorder(
                                  ),
                                  label: const Text(
                                    'capacity', style: TextStyle(fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                      color: Colors.deepOrangeAccent),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 25.0,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) return "can not be empty";
                                  return null;
                                },
                                onFieldSubmitted: (value) {
                                  print(value);
                                },
                                controller: arrivals_to_controller,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  border: OutlineInputBorder(

                                  ),
                                  label: const Text(
                                    'arrivals_to_', style: TextStyle(fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                      color: Colors.deepOrangeAccent),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) return "can not be empty";
                                  return null;
                                },
                                onFieldSubmitted: (value) {
                                  print(value);
                                },
                                controller: departures_from_controller,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  border: OutlineInputBorder(

                                  ),
                                  label: const Text(
                                    'departures_from', style: TextStyle(fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                      color: Colors.deepOrangeAccent),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) return "can not be empty";
                                  return null;
                                },
                                onFieldSubmitted: (value) {
                                  print(value);
                                },
                                controller: date_time_controller,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  border: OutlineInputBorder(

                                  ),
                                  label: const Text(
                                    'date_time', style: TextStyle(fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                      color: Colors.deepOrangeAccent),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) return "can not be empty";
                                  return null;
                                },
                                onFieldSubmitted: (value) {
                                  print(value);
                                },
                                controller: admin_id_controller,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  border: OutlineInputBorder(

                                  ),
                                  label: const Text(
                                    'admin_id_', style: TextStyle(fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                      color: Colors.deepOrangeAccent),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),

                              // هااااااااااااام

                              Center(
                                child: ConditionalBuilder(
                                  condition: state is! AddflightLoading,
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: double.infinity,
                                      color: Colors.deepOrangeAccent,

                                      child: MaterialButton(
                                        onPressed: () {

                                          viewController.showflight();
                                          if (formkey.currentState!.validate()) {
                                            cubit.addingdlight(
                                              country: country_controller.text,
                                              city: city_controller.text,
                                              capacity: (int.parse(capacity_controller.text)),
                                              arrivals_to:
                                              arrivals_to_controller.text,
                                              departures_from:
                                              departures_from_controller.text,
                                              date_time:
                                              date_time_controller.text,
                                              admin_id: (int.parse(admin_id_controller.text)),
                                            );
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return StatefulBuilder(builder:(context,StateSetter setState){
                                                    return AlertDialog(
                                                      title: Text("You are adding a trip"),
                                                      actions: [
                                                        Column(
                                                          children: [
                                                            MaterialButton(onPressed: () {
                                                              viewController.showflight();
                                                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                                                            },child: Text("done"),)
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  } );
                                                }
                                            );
                                          }
                                        },
                                        child: Text(
                                          'Add',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  fallback: (BuildContext context) {
                                    return Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.amber,
                                        ));
                                  },
                                ),
                              ),

                              const SizedBox(
                                height: 10.0,
                              ),
                            ]),
                      )),
                ),
              ),
            );
          },
        ));
  }
}
