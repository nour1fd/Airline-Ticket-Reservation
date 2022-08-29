import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:plane/admin/bussiness/update/updateflight_cubit.dart';
import 'package:plane/admin/bussiness/view/viewflight.dart';
import 'package:plane/admin/button/update/viewtrip_update.dart';
import 'package:plane/admin/cost.dart';
import 'package:plane/admin/model/adminmodel.dart';

class DetailsForFlightUpdate extends StatelessWidget{
  final FlightModeladmin flightModel;
  DetailsForFlightUpdate({required this.flightModel});
  var formkey = GlobalKey<FormState>();

  var countryController = TextEditingController();
  var cityController = TextEditingController();
  var capacityController = TextEditingController();
  var arrivals_toController = TextEditingController();
  var departures_fromController = TextEditingController();
  var date_timeController = TextEditingController();
  var admin_idController = TextEditingController();
  var idController = TextEditingController();

  final ViewFlightgetxadmin viewController = Get.put(ViewFlightgetxadmin());
  @override
  Widget build(BuildContext context) {
    countryController.text=flightModel.country;
    cityController.text=flightModel.city;
    capacityController.text=flightModel.capacity.toString();
    arrivals_toController.text=flightModel.arrivalsTo;
    departures_fromController.text=flightModel.departuresFrom;
    date_timeController.text=flightModel.dateTime.toString();
    admin_idController.text=flightModel.adminId.toString();
    idController.text=flightModel.id.toString();
    id=(int.parse(idController.text));

    return BlocProvider(
        create: (context) => UpdateflightCubit(),
        child: BlocConsumer<UpdateflightCubit, UpdateflightState>(
          listener: (context, state) {},
          builder: (context, state) {
            UpdateflightCubit cubit = UpdateflightCubit.get(context);
            return Scaffold(

              appBar: AppBar(
                backgroundColor: Colors.white24,

                title: Text("Details of the trip",style:
                Theme.of(context).textTheme.headline5!.copyWith(color:
                Colors.black,
                  fontWeight: FontWeight.bold,
                )),
              ),
              body: SingleChildScrollView(
                child: Form(
                  key:formkey ,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),

                        TextFormField(

                          validator: (value) {
                            if(value!.isEmpty)
                              return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: idController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(

                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(
                            ),
                            label: const Text(
                              'id country',
                              style: TextStyle(fontWeight: FontWeight.w900,
                                  fontSize: 20.0,
                                  color: Colors.deepOrangeAccent),

                            ),
                          ),

                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (value) {
                            if(value!.isEmpty)
                              return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: cityController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(

                            ),
                            label: const Text(
                              'city',  style: TextStyle(fontWeight: FontWeight.w900,
                                fontSize: 20.0,
                                color: Colors.deepOrangeAccent),

                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (value) {
                            if(value!.isEmpty)
                              return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: countryController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(

                            ),
                            label: const Text(
                              'country',  style: TextStyle(fontWeight: FontWeight.w900,
                                fontSize: 20.0,
                                color: Colors.deepOrangeAccent),

                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (value) {
                            if(value!.isEmpty)
                              return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: capacityController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(

                            ),
                            label: const Text(
                              'capacity',  style: TextStyle(fontWeight: FontWeight.w900,
                                fontSize: 20.0,
                                color: Colors.deepOrangeAccent),

                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (value) {
                            if(value!.isEmpty)
                              return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: arrivals_toController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(

                            ),
                            label: const Text(
                              'arrivals_to',  style: TextStyle(fontWeight: FontWeight.w900,
                                fontSize: 20.0,
                                color: Colors.deepOrangeAccent),

                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (value) {
                            if(value!.isEmpty)
                              return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: departures_fromController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(

                            ),
                            label: const Text(
                              'departures_from',  style: TextStyle(fontWeight: FontWeight.w900,
                                fontSize: 20.0,
                                color: Colors.deepOrangeAccent),

                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (value) {
                            if(value!.isEmpty)
                              return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: date_timeController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(

                            ),
                            label: const Text(
                              'date_time',  style: TextStyle(fontWeight: FontWeight.w900,
                                fontSize: 20.0,
                                color: Colors.deepOrangeAccent),

                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (value) {
                            if(value!.isEmpty)
                              return "can not be empty";
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          controller: admin_idController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(

                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(

                            ),
                            label: const Text(
                              'id_admin',  style: TextStyle(fontWeight: FontWeight.w900,
                                fontSize: 20.0,
                                color: Colors.deepOrangeAccent),

                            ),
                          ),
                        ),
                        SizedBox(height: 20,),


                        ConditionalBuilder(
                          condition: state is!UpdateflightLoading,
                          builder: (BuildContext context) {
                            return Container(
                              width: double.infinity,
                              color: Colors.deepOrangeAccent,
                              child:
                              MaterialButton(
                                onPressed: () {
                                  viewController.showflight();
                                  if(formkey.currentState!.validate()){
                                    cubit.updatingflight(
                                      country:countryController.text,
                                      city:cityController.text,
                                      capacity:(int.parse(capacityController.text)),
                                      arrivals_to:arrivals_toController.text,
                                      departures_from:departures_fromController.text,
                                      date_time:date_timeController.text,
                                   //  admin_id:admin_idController.text,
                                    );
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return StatefulBuilder(builder:(context,StateSetter setState){
                                            return AlertDialog(
                                              title: Text("You are updating information about this trip"),
                                              actions: [
                                                Column(
                                                  children: [
                                                   MaterialButton(onPressed: () {
                                                     viewController.showflight();

                                                     Navigator.pushReplacement(context,MaterialPageRoute(
                                                         builder: (BuildContext context) => ViewTripsUpdate()));
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
                                  'update',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            );
                          },
                          fallback: (BuildContext context) {
                            return  Center(child:
                            CircularProgressIndicator(color:Colors.amber ,)
                            );
                          },

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));

  }

}